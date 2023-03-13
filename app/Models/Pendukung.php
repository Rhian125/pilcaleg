<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pendukung extends Model
{
    // use HasFactory;
    protected $table = 'support_teams';
    protected $fillable = [
        'support_teams_family_card_number',
        'support_teams_id_number',
        'support_teams_name',
        'support_teams_place_of_birth',
        'support_teams_date_of_birth',
        'support_teams_gender',
        'support_teams_cellphone',
        'support_teams_address',
        'support_teams_must_choose',
        'support_teams_rt',
        'support_teams_rw',
        'support_teams_must_choose',
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
