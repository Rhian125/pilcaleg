<?php

namespace App\Http\Controllers;

use App\Models\Timpendukung;   //nama model
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $tim_pendukung = Timpendukung::where('status_hapus', 0)->count();
        return view('admin.beranda', compact('tim_pendukung'));
    }
}
