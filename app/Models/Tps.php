<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tps extends Model
{
    // use HasFactory;
    protected $table = 'tps';
    protected $fillable = [
        'number_of_tps',
        'tps_information',
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
