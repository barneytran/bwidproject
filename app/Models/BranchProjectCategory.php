<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class BranchProjectCategory extends Model
{
    protected $table = 'branch_project_categories';

    protected $fillable = [
        'branch_id',
        'project_category_id',
        'project_id'
    ];

    public function project()
    {
        return $this->belongsTo(Project::class,'project_id');
    }

    public function project_category()
    {
        return $this->belongsTo(ProjectCategory::class,'project_category_id');
    }

    public function branch()
    {
        return $this->belongsTo(Branch::class,'branch_id');
    }
}
