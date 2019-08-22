<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Violation extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'violation_name', 
        'violation_type_id', 
        'user_id_number',
    ];
    
    public function violationType()
    {
      return $this->hasOne('App\ViolationType');
    }
}
