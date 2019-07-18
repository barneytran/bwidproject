<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectCategoryTranslation extends Model
{
    public $fillable = [
        'slug',
        'description',
        'name'
    ];

    public $timestamps = false;
}
