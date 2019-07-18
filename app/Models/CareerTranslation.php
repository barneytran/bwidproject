<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CareerTranslation extends Model
{
    protected $table = "career_translation";

    protected $fillable = [
        'name',
        'slug',
        'content',
        'description',
        'requirement',
        'benefit',
        'resume_requirement',
    ];

    public $timestamps = false;
}
