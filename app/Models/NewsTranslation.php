<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsTranslation extends Model
{
    protected $table = "news_translation";

    protected $fillable = [
        "title",
        "slug",
        "description",
        "content"
    ];

    public $timestamps = false;
}
