<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Contact extends Model implements Transformable
{
    use TransformableTrait;

    protected $table = 'contacts';

    protected $fillable = [
        'subject',
        'name',
        'phone',
        'email',
        'company',
        'company_profile',
        'information'
    ];
}
