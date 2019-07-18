<?php

namespace App\Models;

use App\Traits\SlugTranslationTrait;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use App\Traits\TranslatableExtendTrait;
use Prettus\Repository\Traits\TransformableTrait;
use App\Traits\MetadataTrait;

/**
 * Class ProjectCategory.
 *
 * @package namespace App\Models;
 */
class ProjectCategory extends Model implements Transformable
{
    use \Dimsav\Translatable\Translatable, TransformableTrait, SlugTranslationTrait,TranslatableExtendTrait, MetadataTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'project_categories';

    protected $fillable = [
        'thumbnail',
        'banner',
        'icon',
        'position',
        'active'
    ];

    public $translatedAttributes = [
        'slug',
        'description',
        'name'
    ];

    public $slug_from_source = 'name'; // dung title để chuyển qua slug trong translation, default name

    public function project()
    {
        return $this->hasMany(Project::class,'category_id');
    }

    public function branch_project_categories()
    {
        return $this->hasMany(BranchProjectCategory::class,'project_category_id');
    }
}
