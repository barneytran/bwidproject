<?php

namespace App\Models;

use App\Traits\SlugTranslationTrait;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use App\Traits\TranslatableExtendTrait;
use Prettus\Repository\Traits\TransformableTrait;
use App\Traits\MetadataTrait;

/**
 * Class Project.
 *
 * @package namespace App\Models;
 */
class Project extends Model implements Transformable
{
    use \Dimsav\Translatable\Translatable, TransformableTrait, SlugTranslationTrait,TranslatableExtendTrait, MetadataTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'projects';

    protected $fillable = [
        'category_id',
        'thumbnail',
        'banner',
        'phone',
        'email',
        'lat',
        'lng',
        'pictures',
        'position',
        'active',
        'features'
    ];

    public $translatedAttributes = [
        'name',
        'slug',
        'address',
        'contact_person',
        'project_file',
        'description',
    ];

    public $slug_from_source = 'name'; // dung title để chuyển qua slug trong translation, default name

    public function category()
    {
        return $this->belongsTo(ProjectCategory::class, 'category_id');
    }

    public function branches()
    {
        return $this->belongsToMany(Branch::class,'branch_project_categories','project_id','branch_id');
    }

    public function pictures_array()
    {
        return json_decode($this->pictures, true) ?? [];
    }

    public function features_array()
    {
        return json_decode($this->features, true) ?? [];
    }
}
