<?php

namespace App\Http\Controllers;

use App\Models\Tps;   //nama model
use App\Models\Kelurahan;   //nama model
use App\Models\Kecamatan;   //nama model
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class TpsController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "TPS";
		$tps = Tps::orderBy('id','DESC')->paginate(10);
		return view('admin.tps.index',compact('title','tps'));
    }

	## Tampilkan Data Search
	public function search(Request $request)
    {
        $title = "Kelurahan";
        $kelurahan = $request->get('search');
        $kelurahan = Kelurahan::where('village_districts_name', 'LIKE', '%'.$kelurahan.'%')
                ->orderBy('id','DESC')->paginate(25)->onEachSide(1);

        return view('admin.kelurahan.index',compact('title','kelurahan'));
    }

	## Tampilkan Form Create
	public function create()
    {
        $title = "TPS";
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $view=view('admin.tps.create',compact('title','kecamatan','kelurahan'));
        $view=$view->render();
        return $view;
    }

	## Simpan Data
	public function store(Request $request)
    {
		$this->validate($request, [
            'number_of_tps' => 'required|string|max:255',
            'tps_information' => 'required|string|max:255',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
		]);

        $input['number_of_tps'] = $request->number_of_tps;
        $input['tps_information'] = $request->tps_information;
        $input['subdistricts_id'] = $request->subdistricts_id;
        $input['village_districts_id'] = $request->village_districts_id;
		$input['user_id'] = Auth::user()->id;
        Tps::create($input);

        activity()->log('Tambah Data TPS');
		return redirect('/tps')->with('status','Data Tersimpan');

    }

	## Tampilkan Form Edit
    public function edit($tps)
    {
        $title = "TPS";
        $tps = Crypt::decrypt($tps);
        $tps = Tps::where('id',$tps)->first();
        $kelurahan = Kelurahan::get();
        $kecamatan = Kecamatan::get();
        $view=view('admin.tps.edit', compact('title','kelurahan','kecamatan','tps'));
        $view=$view->render();
		return $view;
    }

	## Edit Data
    public function update(Request $request, $tps)
    {

        $tps = Crypt::decrypt($tps);
        $tps = Tps::where('id',$tps)->first();

        $this->validate($request, [
            'number_of_tps' => 'required',
            'tps_information' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $tps->fill($request->all());

		$tps->user_id = Auth::user()->id;
        $tps->save();

        activity()->log('Ubah Data TPS dengan ID = '.$tps->id);
		return redirect('/tps')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($kelurahan)
    {
        $kelurahan = Crypt::decrypt($kelurahan);
        $kelurahan = Kelurahan::where('id',$kelurahan)->first();
        $kelurahan->delete();
        activity()->log('Hapus Data Kelurahan dengan ID = '.$kelurahan->id);
		return redirect('/kelurahan')->with('status', 'Data Berhasil Dihapus');
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
