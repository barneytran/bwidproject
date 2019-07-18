<?php

namespace App\Models;

use App\Traits\SlugTranslationTrait;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use App\Traits\TranslatableExtendTrait;
use Prettus\Repository\Traits\TransformableTrait;
use App\Traits\MetadataTrait;

class NewsCategory extends Model implements Transformable
{
    use \Dimsav\Translatable\Translatable, TransformableTrait, SlugTranslationTrait,TranslatableExtendTrait, MetadataTrait;

    protected $table = 'news_categories';

    protected $fillable = [
        'position',
        'code',
        'parent_id',
        'banner'
    ];

    public $translatedAttributes = ['slug', 'name'];

    public $slug_from_source = 'name'; // dung title để chuyển qua slug trong translation, default name

    public function news()
    {
        return $this->hasMany(News::class, "news_category_id");
    }

    public function getUrlAttribute()
    {
        return route('news.category', [
            'category' => $this->slug
        ]);
    }

    public function parent()
    {
        return $this->belongsTo(self::class,'parent_id');
    }

    public function child()
    {
        return $this->hasMany(self::class,'parent_id');
    }
}
