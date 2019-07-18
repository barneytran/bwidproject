<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServiceTranslation extends Model
{
    protected $table = "service_translation";

    protected $fillable = [
        "title",
        "slug",
        "description",
        "content"
    ];

    public $timestamps = false;
}
