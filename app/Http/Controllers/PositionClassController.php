<?php

namespace App\Http\Controllers;

use App\Models\PositionClass;   //nama model
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class PositionClassController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }
	
    ## Tampikan Data
    public function index()
    {
        $title = "Kelas Jabatan";
        $position_class = PositionClass::orderBy('id','ASC')->paginate(25)->onEachSide(1);
        return view('admin.position_class.index',compact('title','position_class'));
    }

	## Tampilkan Data Search
	public function search(Request $request)
    {
        $title = "Kelas Jabatan";
        $position_class = $request->get('search');
        $position_class = PositionClass::where('position_class_name', 'LIKE', '%'.$position_class.'%')
                ->orderBy('id','ASC')->paginate(25)->onEachSide(1);
        
        return view('admin.position_class.index',compact('title','position_class'));
    }
	
    ## Tampilkan Form Create
    public function create()
    {
        $title = "Kelas Jabatan";
		$view=view('admin.position_class.create',compact('title'));
        $view=$view->render();
        return $view;
    }

    ## Simpan Data
    public function store(Request $request)
    {
        $this->validate($request, [
            'position_class_name' => 'required',
        ]);

		$input['position_class_name'] = $request->position_class_name;
		$input['user_id'] = Auth::user()->id;
		
        PositionClass::create($input);
        
        activity()->log('Tambah Data PositionClass');
		return redirect('/position_class')->with('status','Data Tersimpan');
    }

    ## Tampilkan Form Edit
    public function edit($position_class)
    {
        $title = "Kelas Jabatan";
        $position_class = Crypt::decrypt($position_class);
        $position_class = PositionClass::where('id',$position_class)->first();
        $view=view('admin.position_class.edit', compact('title','position_class'));
        $view=$view->render();
        return $view;
    }

    ## Edit Data
    public function update(Request $request, $position_class)
    {
        
        $position_class = Crypt::decrypt($position_class);
        $position_class = PositionClass::where('id',$position_class)->first();

        $this->validate($request, [
            'position_class_name' => 'required',
        ]);

        $position_class->fill($request->all());
        
		$position_class->user_id = Auth::user()->id;
    	$position_class->save();
		
        activity()->log('Ubah Data PositionClass dengan ID = '.$position_class->id);
		return redirect('/position_class')->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($position_class)
    {
        $position_class = Crypt::decrypt($position_class);
        $position_class = PositionClass::where('id',$position_class)->first();
    	$position_class->delete();

        activity()->log('Hapus Data PositionClass dengan ID = '.$position_class->id);
        return redirect('/position_class')->with('status', 'Data Berhasil Dihapus');
    }
}
