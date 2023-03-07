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
        $title = "RT/RW";
        $rt_rw = $request->get('search');
        $rt_rw = RtRw::where('village_districts_name', 'LIKE', '%'.$rt_rw.'%')
                ->orderBy('id','DESC')->paginate(25)->onEachSide(1);

        return view('admin.rt_rw.index',compact('title','rt_rw'));
    }

	## Tampilkan Form Create
	public function create()
    {
        $title = "RT/RW";
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $view=view('admin.rt_rw.create',compact('title','kecamatan','kelurahan'));
        $view=$view->render();
        return $view;
    }

	## Simpan Data
	public function store(Request $request)
    {
		$this->validate($request, [
            'rt_number' => 'required',
            'rw_number' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
		]);

        $input['rt_number'] = $request->rt_number;
        $input['rw_number'] = $request->rw_number;
        $input['subdistricts_id'] = $request->subdistricts_id;
        $input['village_districts_id'] = $request->village_districts_id;
		$input['user_id'] = Auth::user()->id;
        RtRw::create($input);

        activity()->log('Tambah Data RT/RW');
		return redirect('/rt_rw')->with('status','Data Tersimpan');

    }

	## Tampilkan Form Edit
    public function edit($rt_rw)
    {
        $title = "RT/RW";
        $rt_rw = Crypt::decrypt($rt_rw);
        $rt_rw = RtRw::where('id',$rt_rw)->first();
        $kelurahan = Kelurahan::get();
        $kecamatan = Kecamatan::get();
        $view=view('admin.rt_rw.edit', compact('title','kelurahan','kecamatan','rt_rw'));
        $view=$view->render();
		return $view;
    }

	## Edit Data
    public function update(Request $request, $rt_rw)
    {

        $rt_rw = Crypt::decrypt($rt_rw);
        $rt_rw = RtRw::where('id',$rt_rw)->first();

        $this->validate($request, [
            'rt_number' => 'required',
            'rw_number' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $rt_rw->fill($request->all());

		$rt_rw->user_id = Auth::user()->id;
        $rt_rw->save();

        activity()->log('Ubah Data RT/RW dengan ID = '.$rt_rw->id);
		return redirect('/rt_rw')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($rt_rw)
    {
        $rt_rw = Crypt::decrypt($rt_rw);
        $rt_rw = RtRw::where('id',$rt_rw)->first();
        $rt_rw->delete();
        activity()->log('Hapus Data RT/RW dengan ID = '.$rt_rw->id);
		return redirect('/rt_rw')->with('status', 'Data Berhasil Dihapus');
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
