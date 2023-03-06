<?php

namespace App\Http\Controllers;

use App\Models\Kecamatan;   //nama model
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class KecamatanController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "Kecamatan";
        $kecamatan = Kecamatan::orderBy('id','DESC')->paginate(25)->onEachSide(1);
        return view('admin.kecamatan.index',compact('title','kecamatan'));
    }

	## Tampilkan Data Search
	public function search(Request $request)
    {
        $title = "Kecamatan";
        $kecamatan = $request->get('search');
        $kecamatan = Kecamatan::where('subdistricts_name', 'LIKE', '%'.$kecamatan.'%')
                ->orderBy('id','DESC')->paginate(25)->onEachSide(1);

        return view('admin.kecamatan.index',compact('title','kecamatan'));
    }

    ## Tampilkan Form Create
    public function create()
    {
        $title = "kecamatan";
		$view=view('admin.kecamatan.create',compact('title'));
        $view=$view->render();
        return $view;
    }

    ## Simpan Data
    public function store(Request $request)
    {
        $this->validate($request, [
            'subdistricts_name' => 'required',
        ]);

		$input['subdistricts_name'] = $request->subdistricts_name;
		$input['user_id'] = Auth::user()->id;

        Kecamatan::create($input);

        activity()->log('Tambah Data Kecamatan');
		return redirect('/kecamatan')->with('status','Data Tersimpan');
    }

    ## Tampilkan Form Edit
    public function edit($kecamatan)
    {
        $title = "Kecamatan";
        $kecamatan = Crypt::decrypt($kecamatan);
        $kecamatan = Kecamatan::where('id',$kecamatan)->first();
        $view=view('admin.kecamatan.edit', compact('title','kecamatan'));
        $view=$view->render();
        return $view;
    }

    ## Edit Data
    public function update(Request $request, $kecamatan)
    {

        $kecamatan = Crypt::decrypt($kecamatan);
        $kecamatan = Kecamatan::where('id',$kecamatan)->first();

        $this->validate($request, [
            'subdistricts_name' => 'required',
        ]);

        $kecamatan->fill($request->all());

		$kecamatan->user_id = Auth::user()->id;
    	$kecamatan->save();

        activity()->log('Ubah Data Kecamatan dengan ID = '.$kecamatan->id);
		return redirect('/kecamatan')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($kecamatan)
    {
        $kecamatan = Crypt::decrypt($kecamatan);
        $kecamatan = Kecamatan::where('id',$kecamatan)->first();
    	$kecamatan->delete();

        activity()->log('Hapus Data Kecamatan dengan ID = '.$kecamatan->id);
        return redirect('/kecamatan')->with('status', 'Data Berhasil Dihapus');
    }
}
