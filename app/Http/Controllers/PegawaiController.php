<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;   //nama model
use App\Models\User;   //nama model
use App\Imports\PegawaiImport;     // Import data Pegawai
use Maatwebsite\Excel\Facades\Excel; // Excel Library
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Image;
use PDF;

class PegawaiController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "Pegawai";
        $pegawai = Pegawai::where('status_hapus', 0)->orderBy('id', 'DESC')->paginate(25)->onEachSide(1);
        return view('admin.pegawai.index', compact('title', 'pegawai'));
    }

    ## Tampilkan Data Search
    public function search(Request $request)
    {
        $title = "Pegawai";
        $pegawai = $request->get('search');
        $filter = $request->get('filter');

        $pegawai = Pegawai::where('status_hapus', 0)
                            ->when(!empty($filter), function ($query) use ($filter, $pegawai) {
                                $query->where($filter, 'LIKE', '%' . $pegawai . '%');
                            })
                            ->when(empty($filter), function ($query) use ($pegawai) {
                                $query->where('nip', 'LIKE', '%' . $pegawai . '%')
                                        ->orWhere('nama_pegawai', 'LIKE', '%' . $pegawai . '%');
                            })
                            ->orderBy('id', 'DESC')->paginate(25)->onEachSide(1);

        return view('admin.pegawai.index', compact('title', 'pegawai'));
    }

    ## Tampilkan Form Create
    public function create()
    {
        $title = "Pegawai";
        $view = view('admin.pegawai.create', compact('title'));
        $view = $view->render();
        return $view;
    }

    ## Simpan Data
    public function store(Request $request)
    {
        $this->validate($request, [
            'nip' => 'required|unique:pegawai_tbl|numeric|digits:18',
            'nama_pegawai' => 'required',
            'tempat_lahir' => 'required',
            'tanggal_lahir' => 'required',
            'jenis_kelamin' => 'required',
            'alamat' => 'required',
            'agama' => 'required',
            'foto_formal' => 'mimes:jpg,jpeg,png|max:500',
            'foto_kedinasan' => 'mimes:jpg,jpeg,png|max:500',
            'status' => 'required',
            'keterangan' => 'required',
        ]);

        $input['nip'] = $request->nip;
        $input['nama_pegawai'] = $request->nama_pegawai;
        $input['tempat_lahir'] = $request->tempat_lahir;
        $input['tanggal_lahir'] = $request->tanggal_lahir;
        $input['jenis_kelamin'] = $request->jenis_kelamin;
        $input['alamat'] = $request->alamat;
        $input['agama'] = $request->agama;
        $input['gol_darah'] = $request->gol_darah;
        $input['email'] = $request->email;
        $input['status'] = $request->status;
        $input['keterangan'] = $request->keterangan;

        if ($request->file('foto_formal')) {
            $input['foto_formal'] = time() . '.' . $request->file('foto_formal')->getClientOriginalExtension();

            $request->file('foto_formal')->storeAs('public/upload/foto_formal_pegawai', $input['foto_formal']);
            $request->file('foto_formal')->storeAs('public/upload/foto_formal_pegawai/thumbnail', $input['foto_formal']);

            $thumbnailpath = public_path('storage/upload/foto_formal_pegawai/thumbnail/' . $input['foto_formal']);
            $img = Image::make($thumbnailpath)->resize(400, 150, function ($constraint) {
                $constraint->aspectRatio();
            });
            $img->save($thumbnailpath);
        }

        if ($request->file('foto_kedinasan')) {
            $input['foto_kedinasan'] = time() . '.' . $request->file('foto_kedinasan')->getClientOriginalExtension();

            $request->file('foto_kedinasan')->storeAs('public/upload/foto_kedinasan_pegawai', $input['foto_kedinasan']);
            $request->file('foto_kedinasan')->storeAs('public/upload/foto_kedinasan_pegawai/thumbnail', $input['foto_kedinasan']);

            $thumbnailpath = public_path('storage/upload/foto_kedinasan_pegawai/thumbnail/' . $input['foto_kedinasan']);
            $img = Image::make($thumbnailpath)->resize(400, 150, function ($constraint) {
                $constraint->aspectRatio();
            });
            $img->save($thumbnailpath);
        }

        $input['user_id'] = Auth::user()->id;

        Pegawai::create($input);

        activity()->log('Tambah Data Pegawai');
        return redirect('/pegawai')->with('status', 'Data Tersimpan');
    }

    ## Tampilkan Form Edit
    public function edit($pegawai)
    {
        $title = "Pegawai";
        $pegawai = Pegawai::findorFail(Crypt::decrypt($pegawai));
        $view = view('admin.pegawai.edit', compact('title', 'pegawai'));
        $view = $view->render();
        return $view;
    }

    ## Edit Data
    public function update(Request $request, $pegawai)
    {

        $pegawai = Crypt::decrypt($pegawai);
        $pegawai = Pegawai::where('id',$pegawai)->first();

        $this->validate($request, [
            'nip' => 'required|numeric|digits:18',
            'nama_pegawai' => 'required',
            'tempat_lahir' => 'required',
            'tanggal_lahir' => 'required',
            'jenis_kelamin' => 'required',
            'alamat' => 'required',
            'agama' => 'required',
            'foto_formal' => 'mimes:jpg,jpeg,png|max:500',
            'foto_kedinasan' => 'mimes:jpg,jpeg,png|max:500',
            'status' => 'required',
        ]);

        if ($pegawai->foto_formal && $request->file('foto_formal') != "") {
            $image_path = public_path() . '/storage/upload/foto_formal_pegawai/thumbnail/' . $pegawai->foto_formal;
            $image_path2 = public_path() . '/storage/upload/foto_formal_pegawai/' . $pegawai->foto_formal;
            unlink($image_path);
            unlink($image_path2);
        }

        if ($pegawai->foto_kedinasan && $request->file('foto_kedinasan') != "") {
            $image_path = public_path() . '/storage/upload/foto_kedinasan_pegawai/thumbnail/' . $pegawai->foto_kedinasan;
            $image_path2 = public_path() . '/storage/upload/foto_kedinasan_pegawai/' . $pegawai->foto_kedinasan;
            unlink($image_path);
            unlink($image_path2);
        }

        $pegawai->fill($request->all());

        if ($request->file('foto_formal')) {

            $filename = time() . '.' . $request->file('foto_formal')->getClientOriginalExtension();

            $request->file('foto_formal')->storeAs('public/upload/foto_formal_pegawai', $filename);
            $request->file('foto_formal')->storeAs('public/upload/foto_formal_pegawai/thumbnail', $filename);

            $thumbnailpath = public_path('storage/upload/foto_formal_pegawai/thumbnail/' . $filename);
            $img = Image::make($thumbnailpath)->resize(400, 150, function ($constraint) {
                $constraint->aspectRatio();
            });
            $img->save($thumbnailpath);

            $pegawai->foto_formal = $filename;
        }

        if ($request->file('foto_kedinasan')) {
            $filename = time() . '.' . $request->file('foto_kedinasan')->getClientOriginalExtension();

            $request->file('foto_kedinasan')->storeAs('public/upload/foto_kedinasan_pegawai', $filename);
            $request->file('foto_kedinasan')->storeAs('public/upload/foto_kedinasan_pegawai/thumbnail', $filename);

            $thumbnailpath = public_path('storage/upload/foto_kedinasan_pegawai/thumbnail/' . $filename);
            $img = Image::make($thumbnailpath)->resize(400, 150, function ($constraint) {
                $constraint->aspectRatio();
            });
            $img->save($thumbnailpath);

            $pegawai->foto_kedinasan = $filename;
        }

        $pegawai->user_id = Auth::user()->id;
        $pegawai->save();

        activity()->log('Ubah Data Pegawai dengan ID = ' . $pegawai->id);
        return redirect('/pegawai')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($pegawai)
    {

        $pegawai = Crypt::decrypt($pegawai);
        $pegawai = Pegawai::where('id',$pegawai)->first();

        $pegawai->delete();

        activity()->log('Hapus Data Pegawai dengan ID = ' . $pegawai->id);
        return redirect('/pegawai')->with('status', 'Data Berhasil Dihapus');
    }

    ## Import Data
    public function import(Request $request)
	{
		// validasi
		$this->validate($request, [
			'file' => 'required|mimes:csv,xls,xlsx'
		]);

		$file = $request->file('file');
		$nama_file = rand().$file->getClientOriginalName();
		$file->move('public/file_pegawai',$nama_file);
		Excel::import(new PegawaiImport, public_path('/file_pegawai/'.$nama_file));

        return redirect('/pegawai')->with('status', 'Data Berhasil Diimport');
	}

}
