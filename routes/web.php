<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegistrasiController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\TimpendukungController;
use App\Http\Controllers\KecamatanController;
use App\Http\Controllers\KelurahanController;
use App\Http\Controllers\TpsController;
use App\Http\Controllers\DptController;
use App\Http\Controllers\LogController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\MenuAccessController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\SubMenuAccessController;
use App\Http\Controllers\SubMenuController;
use App\Http\Controllers\UserController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Artisan;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes(['verify' => true]);

Route::get('/buat_storage', function () {
    Artisan::call('storage:link');
    dd("Storage Berhasil Di Buat");
});

Route::get('/clear-cache-all', function() {
    Artisan::call('cache:clear');
    dd("Cache Clear All");
});

if (file_exists(app_path('Http/Controllers/LocalizationController.php')))
{
    Route::get('lang/{locale}', [App\Http\Controllers\LocalizationController::class , 'lang']);
}

Route::get('/', function () {
    return view('auth.login');
});

Route::post('/login_w', [LoginController::class, 'authenticate']);
Route::get('registrasi_w', [RegistrasiController::class, 'registrasi']);
Route::post('registrasi_w', [RegistrasiController::class, 'store']);
Route::post('/logout-sistem', [LoginController::class, 'logout']);

Route::get('/dashboard', [HomeController::class, 'index'])->middleware('verified');
Route::get('/user/edit_profil/{user}', [UserController::class, 'edit_profil'])->middleware('verified');
Route::put('/user/edit_profil/{user}', [UserController::class, 'update_profil'])->middleware('verified');

Route::get('database',[DatabaseController::class, 'index']);
Route::post('import_database',[DatabaseController::class, 'store']);
Route::get('/backup_database', function() {
    Artisan::call('database:backup');
    return response()->download(public_path().'/db_backup/backup-' . Carbon::now()->format('Y-m-d') . '.sql');
});

Route::middleware(['user_access','verified'])->group(function () {

    ## Tim Pendukung
    Route::get('/data_pendukung', [TimpendukungController::class, 'index']);
    Route::get('/data_pendukung/search', [TimpendukungController::class, 'search']);
    Route::get('/data_pendukung/create', [TimpendukungController::class, 'create']);
    Route::post('/data_pendukung', [TimpendukungController::class, 'store']);
    Route::get('/data_pendukung/edit/{pegawai}', [TimpendukungController::class, 'edit']);
    Route::put('/data_pendukung/edit/{pegawai}', [TimpendukungController::class, 'update']);
    Route::get('/data_pendukung/hapus/{pegawai}',[TimpendukungController::class, 'delete']);
    Route::post('/data_pendukung/import', [TimpendukungController::class, 'import']);

    Route::get('pdf_reader', function () {
        return view('admin.pdf.index');
    });

    Route::get('image_editor', function () {
        return view('admin.image_editor.index');
    });

    Route::get('/report_excel',[ReportController::class, 'report_excel']);
    Route::get('/report_pdf',[ReportController::class, 'report_pdf']);

    ## Rekapitulasi
    Route::get('/rekapitulasi_jumlah_pegawai', [RekapitulasiController::class, 'rekapitulasi_jumlah_pegawai']);

    ## Kirim Email
    Route::get('/email',[SendEmailController::class, 'index']);
    Route::post('/email',[SendEmailController::class, 'send_email']);

    ## Kecamatan
    Route::get('/kecamatan', [KecamatanController::class, 'index']);
    Route::get('/kecamatan/search', [KecamatanController::class, 'search']);
    Route::get('/kecamatan/create', [KecamatanController::class, 'create']);
    Route::post('/kecamatan', [KecamatanController::class, 'store']);
    Route::get('/kecamatan/edit/{kecamatan}', [KecamatanController::class, 'edit']);
    Route::put('/kecamatan/edit/{kecamatan}', [KecamatanController::class, 'update']);
    Route::get('/kecamatan/hapus/{kecamatan}',[KecamatanController::class, 'delete']);

    ## Kelurahan
    Route::get('/kelurahan', [KelurahanController::class, 'index']);
    Route::get('/kelurahan/search', [KelurahanController::class, 'search']);
    Route::get('/kelurahan/create', [KelurahanController::class, 'create']);
    Route::post('/kelurahan', [KelurahanController::class, 'store']);
    Route::get('/kelurahan/edit/{kelurahan}', [KelurahanController::class, 'edit']);
    Route::put('/kelurahan/edit/{kelurahan}', [KelurahanController::class, 'update']);
    Route::get('/kelurahan/hapus/{kelurahan}',[KelurahanController::class, 'delete']);

    ## TPS
    Route::get('/tps', [TpsController::class, 'index']);
    Route::get('/tps/search', [TpsController::class, 'search']);
    Route::get('/tps/create', [TpsController::class, 'create']);
    Route::post('/tps', [TpsController::class, 'store']);
    Route::get('/tps/edit/{tps}', [TpsController::class, 'edit']);
    Route::put('/tps/edit/{tps}', [TpsController::class, 'update']);
    Route::get('/tps/hapus/{tps}',[TpsController::class, 'delete']);

    ## DPT
    Route::get('/dpt', [DptController::class, 'index']);
    Route::get('/dpt/search', [DptController::class, 'search']);
    Route::get('/dpt/create', [DptController::class, 'create']);
    Route::post('/dpt', [DptController::class, 'store']);
    Route::get('/dpt/edit/{dpt}', [DptController::class, 'edit']);
    Route::put('/dpt/edit/{dpt}', [DptController::class, 'update']);
    Route::get('/dpt/hapus/{dpt}',[DptController::class, 'delete']);

    ##
    Route::get('/kelurahan/village_districts_name/{subdistricts_id}',[KelurahanController::class, 'village_districts_name']);

    ## Group
    Route::get('/group', [GroupController::class, 'index']);
    Route::get('/group/search', [GroupController::class, 'search']);
    Route::get('/group/create', [GroupController::class, 'create']);
    Route::post('/group', [GroupController::class, 'store']);
    Route::get('/group/edit/{group}', [GroupController::class, 'edit']);
    Route::put('/group/edit/{group}', [GroupController::class, 'update']);
    Route::get('/group/hapus/{group}',[GroupController::class, 'delete']);

    ## Menu
    Route::get('/menu/', [MenuController::class, 'index']);
    Route::get('/menu/search', [MenuController::class, 'search']);
    Route::get('/menu/create', [MenuController::class, 'create']);
    Route::post('/menu', [MenuController::class, 'store']);
    Route::get('/menu/edit/{menu}', [MenuController::class, 'edit']);
    Route::put('/menu/edit/{menu}', [MenuController::class, 'update']);
    Route::get('/menu/hapus/{menu}',[MenuController::class, 'delete']);

    ## User
    Route::get('/user', [UserController::class, 'index']);
    Route::get('/user/search', [UserController::class, 'search']);
    Route::get('/user/create', [UserController::class, 'create']);
    Route::post('/user', [UserController::class, 'store']);
    Route::get('/user/edit/{user}', [UserController::class, 'edit']);
    Route::put('/user/edit/{user}', [UserController::class, 'update']);
    Route::get('/user/hapus/{user}',[UserController::class, 'delete']);

    ## Log Activity
    Route::get('/log', [LogController::class, 'index']);
    Route::get('/log/search', [LogController::class, 'search']);

});

Route::middleware(['cek_status','verified'])->group(function () {

    ## Sub Menu
    Route::get('/sub_menu/{id}', [SubMenuController::class, 'index']);
    Route::get('/sub_menu/search/{id}', [SubMenuController::class, 'search']);
    Route::get('/sub_menu/create/{id}', [SubMenuController::class, 'create']);
    Route::post('/sub_menu/{id}', [SubMenuController::class, 'store']);
    Route::get('/sub_menu/edit/{id}/{sub_menu}', [SubMenuController::class, 'edit']);
    Route::put('/sub_menu/edit/{id}/{sub_menu}', [SubMenuController::class, 'update']);
    Route::get('/sub_menu/hapus/{id}/{sub_menu}',[SubMenuController::class, 'delete']);

    ## Menu Akses
    Route::get('/menu_akses/{group}', [MenuAccessController::class, 'index']);
    Route::get('/menu_akses/search/{group}', [MenuAccessController::class, 'search']);
    Route::get('/menu_akses/create/{group}', [MenuAccessController::class, 'create']);
    Route::post('/menu_akses/{group}', [MenuAccessController::class, 'store']);
    Route::get('/menu_akses/edit/{group}/{menu_access}', [MenuAccessController::class, 'edit']);
    Route::put('/menu_akses/edit/{group}/{menu_access}', [MenuAccessController::class, 'update']);
    Route::get('/menu_akses/hapus/{group}/{menu_access}',[MenuAccessController::class, 'delete']);

    ## Sub Menu Akses
    Route::get('/sub_menu_akses/{group}/{menu}', [SubMenuAccessController::class, 'index']);
    Route::get('/sub_menu_akses/search/{group}/{menu}', [SubMenuAccessController::class, 'search']);
    Route::get('/sub_menu_akses/create/{group}/{menu}', [SubMenuAccessController::class, 'create']);
    Route::post('/sub_menu_akses/{group}/{menu}', [SubMenuAccessController::class, 'store']);
    Route::get('/sub_menu_akses/edit/{group}/{menu}/{sub_menu_access}', [SubMenuAccessController::class, 'edit']);
    Route::put('/sub_menu_akses/edit/{group}/{menu}/{sub_menu_access}', [SubMenuAccessController::class, 'update']);
    Route::get('/sub_menu_akses/hapus/{group}/{menu}/{sub_menu_access}',[SubMenuAccessController::class, 'delete']);

    ## Setting
    Route::get('/setting', [SettingController::class, 'index']);
    Route::put('/setting/edit/{setting}', [SettingController::class, 'update']);

});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home')->middleware('verified');
