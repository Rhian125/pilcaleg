<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Saksi extends Model
{
    // use HasFactory;
    protected $table = 'witness';
    protected $fillable = [
        'witness_id_number',
        'witness_name',
        'witness_place_of_birth',
        'witness_date_of_birth',
        'witness_gender',
        'witness_work',
        'witness_address',
        'witness_rt',
        'witness_rw',
        'witness_cellphone',
        'subdistricts_id',
        'village_districts_id',
        'user_id',
    ];

    public function kecamatan(){
        return $this->belongsTo(Kecamatan::class, 'subdistricts_id');
    }

    public function kelurahan(){
        return $this->belongsTo(Kelurahan::class, 'village_districts_id');
    }
}
