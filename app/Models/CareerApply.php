<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class CareerApply extends Model implements Transformable
{
    use TransformableTrait;

    protected $table = 'career_apply';

    protected $fillable = [
        'career_id',
        'name',
        'phone',
        'email',
        'content',
        'attach_file',
    ];

    public function career()
    {
        return $this->belongsTo(Career::class, 'career_id');
    }
}
