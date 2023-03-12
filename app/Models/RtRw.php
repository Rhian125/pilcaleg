<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RtRw extends Model
{
    // use HasFactory;
    protected $table = 'rt_rw';
    protected $fillable = [
        'rt_number',
        'rw_number',
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
