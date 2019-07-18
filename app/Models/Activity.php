<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Activity extends Model implements Transformable
{
    use TransformableTrait;

    protected $table = "activity_log";

    protected $fillable = [
        "log_name",
        "description",
        'causer_id'
    ];

    protected static $activity;
}
