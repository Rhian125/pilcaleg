<?php

namespace App\Http\Controllers;

use App\Models\Setting;   //nama model
use App\Models\User;   //nama model
use Illuminate\Http\Request;

class MapController extends Controller
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
        $setting = Setting::first();
        return view('admin.maps.index', compact('title', 'setting'));
    }
}
