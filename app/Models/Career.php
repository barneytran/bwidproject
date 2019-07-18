<?php

namespace App\Models;

use App\Traits\MetadataTrait;
use App\Traits\SlugTranslationTrait;
use App\Traits\TranslatableExtendTrait;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;
use Carbon\Carbon;

class Career extends Model implements Transformable
{
    use \Dimsav\Translatable\Translatable, TranslatableExtendTrait,  TransformableTrait, MetadataTrait, SlugTranslationTrait;

    protected $table = 'careers';

    protected $fillable = [
        'category_id',
        'published_date',
        'expired_date',
        'status',
        'is_top',
        'accept_aplly',
        'employer' //moi them vao
    ];

    public $translatedAttributes = [
        'name',
        'slug',
        'content',
        'description',
        'requirement',
        'benefit',
        'resume_requirement',
    ];

    public function setCodeAttribute($value)
    {
        $this->attributes['code'] = strtoupper(str_slug(trim($value)));
    }

    public function getPublishedDateFormatAttribute()
    {
        return cvDbTime($this->published_date);
    }
    public function getExpiredDateFormatAttribute()
    {
        return cvDbTime($this->expired_date);
    }

    public static function getStatuses($key = null)
    {
        $arr = [
            'DRAFT' => trans('admin_career.attr.DRAFT'),
            'PUBLISH' => trans('admin_career.attr.PUBLISH'),
            //'CLOSED' => trans('admin_career.attr.CLOSED'),
            //'EXPIRED' => trans('admin_career.attr.EXPIRED'),
        ];
        if ($key !== null && !empty($arr[$key])) {
            return $arr[$key];
        }
        return $arr;
    }

    public static function getEmployer($key = null)
    {
        $arr = [
            'LHC' => trans('admin_career.attr.LHC'),
            'INVESTORS' => trans('admin_career.attr.INVESTORS')
        ];
        if ($key !== null && !empty($arr[$key])) {
            return $arr[$key];
        }
        return $arr;
    }


    public function category()
    {
        return $this->belongsTo(CareerCategory::class, 'category_id');
    }

    public function getEmployerNameAttribute()
    {
        return self::getEmployer($this->employer);
    }

    public function getStatusNameAttribute()
    {
        return self::getStatuses($this->status);
    }

    public function applies()
    {
        return $this->hasMany(CareerApply::class, 'career_id');
    }

    public function cities()
    {
        return $this->belongsToMany(City::class, 'career_city', 'career_id', 'city_id');
    }

    public function getCityNameAttribute()
    {
        $cities = $this->cities;
        $count = $cities->count();
        if ($count > 0) {
            if ($count > 1) {
                return $cities->first()->name . ', ...';
            }
            return $cities->first()->name;
        }
        return null;
    }

    public function getCitiesNameAttribute()
    {
        $cities = $this->cities;
        return $cities->map(function ($city) {
            return $city->name;
        })->implode(', ');
    }
}
