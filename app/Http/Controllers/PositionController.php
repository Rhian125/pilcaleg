<?php

namespace App\Http\Controllers;

use App\Models\Position;   //nama model
use App\Models\PositionClass;   //nama model
use App\Models\Office;   //nama model
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class PositionController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }
	
    ## Tampikan Data
    public function index($position_class_id)
    {
        $title = "Jabatan";
         
        $position_class_id = Crypt::decrypt($position_class_id);
        $position = Position::where('position_class_id',$position_class_id)->orderBy('id','DESC')->paginate(25)->onEachSide(1);
        return view('admin.position.index',compact('title','position_class_id','position'));
    }

    ## Tampilkan Data Search
    public function search(Request $request, $position_class_id)
    {
        $title = "Menu Akses";

        $position_class_id = Crypt::decrypt($position_class_id);

        $position = $request->get('search');
        $position = Position::where('position_class_id',$position_class_id)
                    ->where('position_name', 'LIKE', '%'.$position.'%')
                    ->orderBy('id','DESC')
                    ->paginate(25)->onEachSide(1);
        
        return view('admin.position.index',compact('title','position_class_id','position'));
    }
     
    
    ## Tampilkan Form Create
    public function create($position_class_id)
    {
        $title = "Jabatan";
        
        $position_class_id = Crypt::decrypt($position_class_id);
        $position = Position::where('id',$position_class_id)->first();

        $office = Office::get();
        $leader = Position::get();
        $view=view('admin.position.create',compact('title','office','position_class_id','position','leader'));
        $view=$view->render();
        return $view;
    }

    ## Simpan Data
    public function store($position_class_id, Request $request)
    {
        
        $position_class_id = Crypt::decrypt($position_class_id);

        $this->validate($request, [
            'position_name' => 'required',
        ]);

        $input['position_name'] = $request->position_name;
        $input['position_leader'] = $request->position_leader;
        $input['position_class_id'] = $position_class_id;
        $input['office_id'] = $request->office_id;
        $input['user_id'] = Auth::user()->id;
        
        Position::create($input);
        
        activity()->log('Tambah Data Jabatan');
        return redirect('/position/'.Crypt::encrypt($position_class_id))->with('status','Data Tersimpan');
    }
    
    ## Tampilkan Form Edit
    public function edit($position_class_id, $position)
    {
        $title = "Jabatan";
        
        $position_class_id = Crypt::decrypt($position_class_id);
        $position = Crypt::decrypt($position);
        $position = Position::where('id',$position)->first();

        $office = Office::get();
        $leader = Position::get();
        $view=view('admin.position.edit', compact('title','position_class_id','office','position','leader'));
        $view=$view->render();
        return $view;
    }

    ## Edit Data
    public function update(Request $request, $position_class_id, $position)
    {
        $position = Crypt::decrypt($position);
        $position = Position::where('id',$position)->first();

        $this->validate($request, [
            'position_name' => 'required'
        ]);

        $position->fill($request->all());
        
        $position->user_id = Auth::user()->id;
        $position->save();
        
        activity()->log('Ubah Data Jabatan dengan ID = '.$position->id);
        return redirect('/position/'.$position_class_id)->with('status', 'Data Berhasil Diubah');
    }

    ## Hapus Data
    public function delete($position_class_id, $position)
    {
        $position = Crypt::decrypt($position);
        $position = Position::where('id',$position)->first();
        $position->delete();

        activity()->log('Hapus Data Jabatan dengan ID = '.$position->id);
        return redirect('/position/'.$position_class_id)->with('status', 'Data Berhasil Dihapus');
    }
 
}
