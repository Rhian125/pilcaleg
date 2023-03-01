<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timpendukung extends Model
{
    // use HasFactory;
    protected $table = 'support_teams';
    protected $fillable = [
        'timpemenangan_nama',
        'timpemenangan_tempatlahir',
        'timpemenangan_tgllahir',
        'timpemenangan_kk',
        'timpemenangan_ktp',
        'timpemenangan_jeniskelamin',
        'timpemenangan_alamat',
        'timpemenangan_rt',
        'timpemenangan_rw',
        'timpemenangan_pekerjaan',
        'timpemenangan_hp',
        'timpemenangan_wajibpilih',
        'kecamatan_id',
        'kelurahan_id',
    ];
}
