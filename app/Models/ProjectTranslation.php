<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectTranslation extends Model
{
    public $fillable = [
        'name',
        'slug',
        'address',
        'contact_person',
        'project_file',
        'description'
    ];

    public $timestamps = false;

}
