<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ImageUpload;
use Illuminate\Routing\Controller;

class ImageUploadController extends Controller
{
    ## Cek Login
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $title = "Upload Image Dropzone";
        return view('admin.dropzone.index',compact('title'));
    }

    public function store(Request $request)
    {
        $image = $request->file('file');
        $imageName = $image->getClientOriginalName();
        $image->move(public_path('dropzone'),$imageName);

        $imageUpload = new ImageUpload();
        $imageUpload->filename = $imageName;
        $imageUpload->save();
        return response()->json(['success'=>$imageName]);
    }

    public function delete(Request $request)
    {
        $filename =  $request->get('filename');
        ImageUpload::where('filename',$filename)->delete();
        $path=public_path().'/dropzone/'.$filename;
        if (file_exists($path)) {
            unlink($path);
        }
        return $filename;
    }

}
