<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Branch extends Model implements Transformable
{
    use \Dimsav\Translatable\Translatable, TransformableTrait;

    protected $table = 'branch';

    protected $fillable = [
        'city_id',
        'lat',
        'lng',
        'image',
        'icon',
        'phone',
        'fax',
        'email'
    ];

    public $translatedAttributes = [
        'name',
        'open_time',
        'address'
    ];

    public function city()
    {
        return $this->belongsTo(City::class, 'city_id');
    }

    public function project_categories()
    {
        return $this->belongsToMany(ProjectCategory::class,'branch_project_categories','branch_id','project_category_id');
    }

    public function branch_project_categories()
    {
        return $this->hasMany(BranchProjectCategory::class,'branch_id');
    }
}
