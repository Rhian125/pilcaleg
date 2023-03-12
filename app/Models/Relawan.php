<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Relawan extends Model
{
    // use HasFactory;
    protected $table = 'volunteers';
    protected $fillable = [
        'volunteers_id_number',
        'volunteers_name',
        'volunteers_place_of_birth',
        'volunteers_date_of_birth',
        'volunteers_gender',
        'volunteers_address',
        'volunteers_rt',
        'volunteers_rw',
        'volunteers_cellphone',
        'jobs_id',
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

    public function jobs(){
        return $this->belongsTo(Jobs::class, 'jobs_id');
    }
}
