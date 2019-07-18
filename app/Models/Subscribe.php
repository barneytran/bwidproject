<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Subscribe extends Model implements Transformable
{
    use TransformableTrait;

    protected $table = 'subscribe';

    protected $fillable = [
        'email'
    ];
}
