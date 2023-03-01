<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PositionClass extends Model
{
    use HasFactory;
    protected $fillable =[
        'position_class_name',
        'user_id'
    ];

    public function user()
    {
        return $this->hasOne('App\Models\User');
    }
    
    public function position()
    {
        return $this->hasMany('App\Models\Position');
    }
}
