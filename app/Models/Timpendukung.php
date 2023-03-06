<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timpendukung extends Model
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
        'support_teams_work',
        'support_teams_cellphone',
        'support_teams_address',
        'support_teams_must_choose',
        'support_teams_rt',
        'support_teams_rw',
        'support_teams_must_choose',
        'subdistricts_id',
        'village_districts_id',
        'user_id',
    ];
}
