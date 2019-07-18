<?php

namespace App\Repositories;

use App\Jobs\ExportBranchToXmlJob;
use App\Traits\UploadPhotoTrait;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\BranchRepository;
use App\Models\Branch;
use App\Validators\BranchValidator;

/**
 * Class BranchRepositoryEloquent
 * @package namespace App\Repositories;
 */
class BranchRepositoryEloquent extends BaseRepository implements BranchRepository
{
    use UploadPhotoTrait;

    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Branch::class;
    }

    /**
     * Specify Validator class name
     *
     * @return mixed
     */
    public function validator()
    {
        return BranchValidator::class;
    }


    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }

    public function datatable()
    {
        return $this->model->withTranslation();
    }

    public function store(array $input)
    {
        $model =  $this->model->create($input);

        $project_category = [];
        if(isset($input['project_category_id']))
        foreach ($input['project_category_id'] as $item)
            $project_category[$item] = ['project_id'=>$input['project_category_project'][$item][0]];
        $model->project_categories()->sync($project_category);
        return $model;
    }

    public function update(array $input, $id)
    {
        $model = $this->model->findOrFail($id);
        $model->update($input);

        $project_category = [];
        if(isset($input['project_category_id']))
        foreach ($input['project_category_id'] as $item)
            $project_category[$item] = ['project_id'=>$input['project_category_project'][$item][0]];

        $model->project_categories()->sync($project_category);
        return $model;
    }

    public function destroy($id)
    {
        $model = $this->model->findOrFail($id);
        $model->delete();
    }

    public function branches(array $arr = [])
    {
        $model = $this->model->select('*');
        if (!empty($arr['type'])) {
            $model->where('type', $arr['type']);
        }
        if (!empty($arr['city_id'])) {
            $model->where('city_id', $arr['city_id']);
        }
        if (isset($arr['parent_id']) && $arr['parent_id'] !== '') {
            $model->where('parent_id', $arr['parent_id']);
        }

        return $model->withTranslation()->get();
    }
}
