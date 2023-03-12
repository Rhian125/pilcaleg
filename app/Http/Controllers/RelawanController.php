<?php

namespace App\Http\Controllers;

use App\Models\Relawan;   //nama model
use App\Models\User;   //nama model
use App\Models\Jobs;   //nama model
use App\Imports\RelawanImport;     // Import data Pegawai
use Maatwebsite\Excel\Facades\Excel; // Excel Library
use App\Http\Controllers\Controller;
use App\Models\Kecamatan;
use App\Models\Kelurahan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Image;
use PDF;

class RelawanController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "Relawan";
        $relawan = Relawan::orderBy('id', 'DESC')->paginate(25)->onEachSide(1);
        return view('admin.relawan.index', compact('title', 'relawan'));
    }

    ## Tampilkan Data Search
    public function search(Request $request)
    {
        $title = "Relawan";
        $relawan = $request->get('search');
        $filter = $request->get('filter');

        $relawan = Relawan::where('status_hapus', 0)
                            ->when(!empty($filter), function ($query) use ($filter, $relawan) {
                                $query->where($filter, 'LIKE', '%' . $relawan . '%');
                            })
                            ->when(empty($filter), function ($query) use ($relawan) {
                                $query->where('volunteers_id_number', 'LIKE', '%' . $relawan . '%')
                                        ->orWhere('volunteers_name', 'LIKE', '%' . $relawan . '%');
                            })
                            ->orderBy('id', 'DESC')->paginate(25)->onEachSide(1);

        return view('admin.relawan.index', compact('title', 'relawan'));
    }

    ## Tampilkan Form Create
    public function create()
    {
        $title = "Relawan";
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $jobs = Jobs::get();
        $view = view('admin.relawan.create', compact('title', 'kecamatan', 'kelurahan', 'jobs'));
        $view = $view->render();
        return $view;
    }

    ## Simpan Data
    public function store(Request $request)
    {
        $this->validate($request, [
            'volunteers_id_number' => 'required|unique:volunteers|numeric|digits:16',
            'volunteers_name' => 'required',
            'volunteers_place_of_birth' => 'required',
            'volunteers_date_of_birth' => 'required',
            'volunteers_gender' => 'required',
            'volunteers_address' => 'required',
            'volunteers_rt' => 'required',
            'volunteers_rw' => 'required',
            'volunteers_cellphone' => 'required',
            'jobs_id' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $input['volunteers_id_number'] = $request->volunteers_id_number;
        $input['volunteers_name'] = $request->volunteers_name;
        $input['volunteers_place_of_birth'] = $request->volunteers_place_of_birth;
        $input['volunteers_date_of_birth'] = $request->volunteers_date_of_birth;
        $input['volunteers_gender'] = $request->volunteers_gender;
        $input['volunteers_address'] = $request->volunteers_address;
        $input['volunteers_rt'] = $request->volunteers_rt;
        $input['volunteers_rw'] = $request->volunteers_rw;
        $input['volunteers_cellphone'] = $request->volunteers_cellphone;
        $input['jobs_id'] = $request->jobs_id;
        $input['subdistricts_id'] = $request->subdistricts_id;
        $input['village_districts_id'] = $request->village_districts_id;

        $input['user_id'] = Auth::user()->id;

        Relawan::create($input);

        activity()->log('Tambah Data Relawan');
        return redirect('/relawan')->with('status', 'Data Tersimpan');
    }

    ## Tampilkan Form Edit
    public function edit($relawan)
    {
        $title = "Relawan";
        $relawan = Relawan::findorFail(Crypt::decrypt($relawan));
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $jobs = Jobs::get();
        $view = view('admin.relawan.edit', compact('title', 'relawan', 'kecamatan', 'kelurahan','jobs'));
        $view = $view->render();
        return $view;
    }

    ## Edit Data
    public function update(Request $request, $relawan)
    {

        $relawan = Crypt::decrypt($relawan);
        $relawan = Relawan::where('id',$relawan)->first();

        $this->validate($request, [
            'volunteers_id_number' => 'required|numeric|digits:16',
            'volunteers_name' => 'required',
            'volunteers_place_of_birth' => 'required',
            'volunteers_date_of_birth' => 'required',
            'volunteers_gender' => 'required',
            'volunteers_address' => 'required',
            'volunteers_rt' => 'required',
            'volunteers_rw' => 'required',
            'volunteers_cellphone' => 'required',
            'jobs_id' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $relawan->fill($request->all());

        $relawan->user_id = Auth::user()->id;
        $relawan->save();

        activity()->log('Ubah Data Relawan dengan ID = ' . $relawan->id);
        return redirect('/relawan')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($relawan)
    {

        $relawan = Crypt::decrypt($relawan);
        $relawan = Relawan::where('id',$relawan)->first();

        $relawan->delete();

        activity()->log('Hapus Data Relawan dengan ID = ' . $relawan->id);
        return redirect('/relawan')->with('status', 'Data Berhasil Dihapus');
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
		$file->move('public/file_relawan',$nama_file);
		Excel::import(new RelawanImport, public_path('/file_relawan/'.$nama_file));

        return redirect('/relawan')->with('status', 'Data Berhasil Diimport');
	}

}
