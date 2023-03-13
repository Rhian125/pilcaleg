<?php

namespace App\Http\Controllers;

use App\Models\Pendukung;   //nama model
use App\Models\User;   //nama model
use App\Models\Jobs;   //nama model
use App\Imports\PendukungImport;     // Import data Pegawai
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

class PendukungController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    ## Tampikan Data
    public function index()
    {
        $title = "Pendukung";
        $pendukung = Pendukung::orderBy('id', 'DESC')->paginate(25)->onEachSide(1);
        return view('admin.pendukung.index', compact('title', 'pendukung'));
    }

    ## Tampilkan Data Search
    public function search(Request $request)
    {
        $title = "Pendukung";
        $pendukung = $request->get('search');
        $filter = $request->get('filter');

        $pendukung = Pendukung::when(!empty($filter), function ($query) use ($filter, $pendukung) {
                                $query->where($filter, 'LIKE', '%' . $pendukung . '%');
                            })
                            ->when(empty($filter), function ($query) use ($pendukung) {
                                $query->where('support_teams_family_card_number', 'LIKE', '%' . $pendukung . '%')
                                        ->orWhere('support_teams_id_number', 'LIKE', '%' . $pendukung . '%')
                                        ->orWhere('support_teams_name', 'LIKE', '%' . $pendukung . '%');
                            })
                            ->orderBy('id', 'DESC')->paginate(25)->onEachSide(1);

        return view('admin.pendukung.index', compact('title', 'pendukung'));
    }

    ## Tampilkan Form Create
    public function create()
    {
        $title = "Pendukung";
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $jobs = Jobs::get();
        $view = view('admin.pendukung.create', compact('title', 'kecamatan', 'kelurahan', 'jobs'));
        $view = $view->render();
        return $view;
    }

    ## Simpan Data
    public function store(Request $request)
    {
        $this->validate($request, [
            'support_teams_family_card_number' => 'required|unique:support_teams|numeric|digits:16',
            'support_teams_id_number' => 'required|unique:support_teams|numeric|digits:16',
            'support_teams_name' => 'required',
            'support_teams_place_of_birth' => 'required',
            'support_teams_date_of_birth' => 'required',
            'support_teams_gender' => 'required',
            'support_teams_address' => 'required',
            'support_teams_rt' => 'required',
            'support_teams_rw' => 'required',
            'support_teams_cellphone' => 'required',
            'support_teams_must_choose' => 'required',
            'jobs_id' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $input['support_teams_family_card_number'] = $request->support_teams_family_card_number;
        $input['support_teams_id_number'] = $request->support_teams_id_number;
        $input['support_teams_name'] = $request->support_teams_name;
        $input['support_teams_place_of_birth'] = $request->support_teams_place_of_birth;
        $input['support_teams_date_of_birth'] = $request->support_teams_date_of_birth;
        $input['support_teams_gender'] = $request->support_teams_gender;
        $input['support_teams_address'] = $request->support_teams_address;
        $input['support_teams_rt'] = $request->support_teams_rt;
        $input['support_teams_rw'] = $request->support_teams_rw;
        $input['support_teams_cellphone'] = $request->support_teams_cellphone;
        $input['support_teams_must_choose'] = $request->support_teams_must_choose;
        $input['jobs_id'] = $request->jobs_id;
        $input['subdistricts_id'] = $request->subdistricts_id;
        $input['village_districts_id'] = $request->village_districts_id;

        $input['user_id'] = Auth::user()->id;

        Pendukung::create($input);

        activity()->log('Tambah Data Pendukung');
        return redirect('/pendukung')->with('status', 'Data Tersimpan');
    }

    ## Tampilkan Form Edit
    public function edit($pendukung)
    {
        $title = "Pendukung";
        $pendukung = Pendukung::findorFail(Crypt::decrypt($pendukung));
        $kecamatan = Kecamatan::get();
        $kelurahan = Kelurahan::get();
        $jobs = Jobs::get();
        $view = view('admin.pendukung.edit', compact('title', 'pendukung', 'kecamatan', 'kelurahan','jobs'));
        $view = $view->render();
        return $view;
    }

    ## Edit Data
    public function update(Request $request, $pendukung)
    {

        $pendukung = Crypt::decrypt($pendukung);
        $pendukung = Pendukung::where('id',$pendukung)->first();

        $this->validate($request, [
            'support_teams_family_card_number' => 'required|numeric|digits:16',
            'support_teams_id_number' => 'required|numeric|digits:16',
            'support_teams_name' => 'required',
            'support_teams_place_of_birth' => 'required',
            'support_teams_date_of_birth' => 'required',
            'support_teams_gender' => 'required',
            'support_teams_address' => 'required',
            'support_teams_rt' => 'required',
            'support_teams_rw' => 'required',
            'support_teams_cellphone' => 'required',
            'support_teams_must_choose' => 'required',
            'jobs_id' => 'required',
            'subdistricts_id' => 'required',
            'village_districts_id' => 'required',
        ]);

        $pendukung->fill($request->all());

        $pendukung->user_id = Auth::user()->id;
        $pendukung->save();

        activity()->log('Ubah Data Pendukung dengan ID = ' . $pendukung->id);
        return redirect('/pendukung')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($pendukung)
    {

        $pendukung = Crypt::decrypt($pendukung);
        $pendukung = Pendukung::where('id',$pendukung)->first();

        $pendukung->delete();

        activity()->log('Hapus Data Pendukung dengan ID = ' . $pendukung->id);
        return redirect('/pendukung')->with('status', 'Data Berhasil Dihapus');
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
		$file->move('public/file_pendukung',$nama_file);
		Excel::import(new PendukungImport, public_path('/file_pendukung/'.$nama_file));

        return redirect('/pendukung')->with('status', 'Data Berhasil Diimport');
	}

}
