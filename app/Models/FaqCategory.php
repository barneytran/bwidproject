<?php

namespace App\Models;

use App\Traits\MetadataTrait;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;
use Illuminate\Database\Eloquent\Builder;

class FaqCategory extends Model implements Transformable
{
    use \Dimsav\Translatable\Translatable, TransformableTrait;

    protected $table = 'faq_categories';

    protected $fillable = [
        'position'
    ];

    public $translatedAttributes = ['name'];

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('position', function (Builder $builder) {
            $builder->orderBy('position', 'asc');
        });
    }

    public function faqs()
    {
        return $this->hasMany(Faq::class, "category_id");
    }
}
