<?php

namespace App\Http\Controllers;

use App\Models\Kelurahan;   //nama model
use App\Models\Kecamatan;   //nama model
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class KelurahanController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "Kelurahan";
		$kelurahan = Kelurahan::orderBy('id','DESC')->paginate(10);
		return view('admin.kelurahan.index',compact('title','kelurahan'));
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
        $title = "Kelurahan";
        $kecamatan = Kecamatan::get();
        $view=view('admin.kelurahan.create',compact('title','kecamatan'));
        $view=$view->render();
        return $view;
    }

	## Simpan Data
	public function store(Request $request)
    {
		$this->validate($request, [
            'village_districts_name' => 'required|string|max:255',
            'subdistricts_id' => 'required',
		]);

        $input['village_districts_name'] = $request->village_districts_name;
        $input['subdistricts_id'] = $request->subdistricts_id;
		$input['user_id'] = Auth::user()->id;
        Kelurahan::create($input);

        activity()->log('Tambah Data Kelurahan');
		return redirect('/kelurahan')->with('status','Data Tersimpan');

    }

	## Tampilkan Form Edit
    public function edit($kelurahan)
    {
        $title = "Kelurahan";
        $kelurahan = Crypt::decrypt($kelurahan);
        $kelurahan = Kelurahan::where('id',$kelurahan)->first();
        $kecamatan = Kecamatan::get();
        $view=view('admin.kelurahan.edit', compact('title','kelurahan','kecamatan'));
        $view=$view->render();
		return $view;
    }

	## Edit Data
    public function update(Request $request, $kelurahan)
    {

        $kelurahan = Crypt::decrypt($kelurahan);
        $kelurahan = Kelurahan::where('id',$kelurahan)->first();

        $this->validate($request, [
            'village_districts_name' => 'required',
            'subdistricts_id' => 'required',
        ]);

        $kelurahan->fill($request->all());

		$kelurahan->user_id = Auth::user()->id;
        $kelurahan->save();

        activity()->log('Ubah Data Kelurahan dengan ID = '.$kelurahan->id);
		return redirect('/kelurahan')->with('status', 'Data Berhasil Diubah');
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

    public function village_districts_name($subdistricts_id)
    {
        $kelurahan = Kelurahan::
                  where('subdistricts_id',$subdistricts_id)
                  ->orderBy('id','ASC')->get();

        echo "<option value=''> -Pilih Kelurahan-</option>";
        foreach($kelurahan as $v){
            echo "<option value='".$v->id."' >".$v->village_districts_name."</option>";
        }
    }
}
