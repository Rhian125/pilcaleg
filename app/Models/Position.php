<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    use HasFactory;
    protected $fillable =[
        'position_name',
        'position_leader',
        'position_class_id',
        'office_id',
        'user_id'
    ];

    public function position_class(){
        return $this->belongsTo(PositionClass::class, 'position_class_id');
    }

    public function office(){
        return $this->belongsTo(Office::class, 'office_id');
    }
}
