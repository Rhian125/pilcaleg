<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kecamatan extends Model
{
    // use HasFactory;
    protected $table = 'subdistricts';
    protected $fillable = [
        'subdistricts_name',
        'user_id',
    ];
}
