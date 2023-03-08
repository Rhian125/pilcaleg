<?php

namespace App\Http\Controllers;

use App\Models\Kelurahan;   //nama model
use App\Models\Kecamatan;   //nama model
use App\Models\RtRw;
use App\Models\Saksi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class SaksiController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "Data Saksi";
		$saksi = Saksi::orderBy('id','DESC')->paginate(10);
		return view('admin.saksi.index',compact('title','saksi'));
    }

	## Tampilkan Data Search
	public function search(Request $request)
    {
        $title = "SAKSI";
        $saksi = $request->get('search');
        $saksi = Saksi::where('village_districts_name', 'LIKE', '%'.$saksi.'%')
                ->orderBy('id','DESC')->paginate(25)->onEachSide(1);

        return view('admin.saksi.index',compact('title','saksi'));
    }

	## Tampilkan Form Create
	public function create()
    {
        $title = "Saksi";
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $rt_rw = RtRw::get();
        $view=view('admin.saksi.create',compact('title','kecamatan','kelurahan', 'rt_rw'));
        $view=$view->render();
        return $view;
    }

	## Simpan Data
	public function store(Request $request)
    {
		$this->validate($request, [
            'witness_id_number' => 'required',
            'witness_name' => 'required',
            'witness_place_of_birth' => 'required',
            'witness_date_of_birth' => 'required',
            'witness_gender' => 'required',
            'witness_work' => 'required',
            'witness_address' => 'required',
            'rt_number' => 'required',
            'witness_rt' => 'required',
            'witness_rw' => 'required',
            'witness_cellphone' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
		]);

        $input['witness_id_number'] = $request->witness_id_number;
        $input['witness_name'] = $request->witness_name;
        $input['witness_place_of_birth'] = $request->witness_place_of_birth;
        $input['witness_date_of_birth'] = $request->witness_date_of_birth;
        $input['witness_gender'] = $request->witness_gender;
        $input['witness_work'] = $request->witness_work;
        $input['witness_address'] = $request->witness_address;
        $input['witness_rt'] = $request->witness_rt;
        $input['witness_rw'] = $request->witness_rw;
        $input['witness_cellphone'] = $request->witness_cellphone;
        $input['subdistricts_id'] = $request->subdistricts_id;
        $input['village_districts_id'] = $request->village_districts_id;
		$input['user_id'] = Auth::user()->id;
        Saksi::create($input);

        activity()->log('Tambah Data Saksi');
		return redirect('/saksi')->with('status','Data Tersimpan');

    }

	## Tampilkan Form Edit
    public function edit($saksi)
    {
        $title = "SAKSI";
        $saksi = Crypt::decrypt($saksi);
        $saksi = Saksi::where('id',$saksi)->first();
        $kelurahan = Kelurahan::get();
        $kecamatan = Kecamatan::get();
        $rt_rw = RtRw::get();
        $view=view('admin.saksi.edit', compact('title','kelurahan','kecamatan','rt_rw','saksi'));
        $view=$view->render();
		return $view;
    }

	## Edit Data
    public function update(Request $request, $saksi)
    {

        $saksi = Crypt::decrypt($saksi);
        $saksi = RtRw::where('id',$saksi)->first();

        $this->validate($request, [
            'witness_id_number' => 'required',
            'witness_name' => 'required',
            'witness_place_of_birth' => 'required',
            'witness_date_of_birth' => 'required',
            'witness_gender' => 'required',
            'witness_work' => 'required',
            'witness_address' => 'required',
            'witness_rt' => 'required',
            'witness_rw' => 'required',
            'witness_cellphone' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $saksi->fill($request->all());

		$saksi->user_id = Auth::user()->id;
        $saksi->save();

        activity()->log('Ubah Data Saksi dengan ID = '.$saksi->id);
		return redirect('/saksi')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($saksi)
    {
        $saksi = Crypt::decrypt($saksi);
        $saksi = Saksi::where('id',$saksi)->first();
        $saksi->delete();
        activity()->log('Hapus Data Saksi dengan ID = '.$saksi->id);
		return redirect('/saksi')->with('status', 'Data Berhasil Dihapus');
    }

    // public function village_districts_name($subdistricts_id)
    // {
    //     $kelurahan = Kelurahan::
    //               where('subdistricts_id',$subdistricts_id)
    //               ->orderBy('id','ASC')->get();

    //     echo "<option value=''> -Pilih Kelurahan-</option>";
    //     foreach($kelurahan as $v){
    //         echo "<option value='".$v->kelurahan->id."' >".$v->kelurahan->village_districts_name."</option>";
    //     }
    // }

}
