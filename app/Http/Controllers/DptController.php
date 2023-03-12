<?php

namespace App\Http\Controllers;

// use App\Models\Tps;   //nama model

use App\Models\Dpt;
use App\Models\Kelurahan;   //nama model
use App\Models\Kecamatan;   //nama model
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class DptController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "DPT";
		$dpt = Dpt::orderBy('id','DESC')->paginate(10);
		return view('admin.dpt.index',compact('title','dpt'));
    }

	## Tampilkan Data Search
	public function search(Request $request)
    {
        $title = "DPT";
        $kelurahan = $request->get('search');
        $kelurahan = Kelurahan::where('village_districts_name', 'LIKE', '%'.$kelurahan.'%')
                ->orderBy('id','DESC')->paginate(25)->onEachSide(1);

        return view('admin.kelurahan.index',compact('title','kelurahan'));
    }

	## Tampilkan Form Create
	public function create()
    {
        $title = "DPT";
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $view=view('admin.dpt.create',compact('title','kecamatan','kelurahan'));
        $view=$view->render();
        return $view;
    }

	## Simpan Data
	public function store(Request $request)
    {
		$this->validate($request, [
            'amount_dpt_male' => 'required',
            'amount_dpt_female' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
		]);

        $input['amount_dpt_male'] = $request->amount_dpt_male;
        $input['amount_dpt_female'] = $request->amount_dpt_female;
        $input['subdistricts_id'] = $request->subdistricts_id;
        $input['village_districts_id'] = $request->village_districts_id;
		$input['user_id'] = Auth::user()->id;
        Dpt::create($input);

        activity()->log('Tambah Data DPT');
		return redirect('/dpt')->with('status','Data Tersimpan');

    }

	## Tampilkan Form Edit
    public function edit($dpt)
    {
        $title = "DPT";
        $dpt = Crypt::decrypt($dpt);
        $dpt = Dpt::where('id',$dpt)->first();
        $kelurahan = Kelurahan::get();
        $kecamatan = Kecamatan::get();
        $view=view('admin.dpt.edit', compact('title','kelurahan','kecamatan','dpt'));
        $view=$view->render();
		return $view;
    }

	## Edit Data
    public function update(Request $request, $dpt)
    {

        $dpt = Crypt::decrypt($dpt);
        $dpt = Dpt::where('id',$dpt)->first();

        $this->validate($request, [
            'amount_dpt_male' => 'required',
            'amount_dpt_female' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $dpt->fill($request->all());

		$dpt->user_id = Auth::user()->id;
        $dpt->save();

        activity()->log('Ubah Data DPT dengan ID = '.$dpt->id);
		return redirect('/dpt')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($dpt)
    {
        $dpt = Crypt::decrypt($dpt);
        $dpt = Dpt::where('id',$dpt)->first();
        $dpt->delete();
        activity()->log('Hapus Data Kelurahan dengan ID = '.$dpt->id);
		return redirect('/dpt')->with('status', 'Data Berhasil Dihapus');
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
