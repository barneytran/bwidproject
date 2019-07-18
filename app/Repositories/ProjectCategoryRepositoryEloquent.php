<?php

namespace App\Repositories;

use App\Models\ProjectCategory;
use App\Traits\CategoryRepositoryTrait;
use App\Traits\RepositoryTrait;
use Prettus\Repository\Criteria\RequestCriteria;
use Prettus\Repository\Eloquent\BaseRepository;
use DB;

/**
 * Class ProjectCategoryRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class ProjectCategoryRepositoryEloquent extends BaseRepository implements ProjectCategoryRepository
{
    use CategoryRepositoryTrait, RepositoryTrait;
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return ProjectCategory::class;
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
        return $this->model->select('*')->withTranslation();
    }

    public function create(array $input)
    {
        $model = $this->model->create($input);
        if (!empty($input['metadata'])) {
            $model->metaCreateOrUpdate($input['metadata']);
        }
        $model->updateSlugTranslation();
        return $model;
    }

    public function update(array $input, $id)
    {
        $model = $this->find($id);
        $model->update($input);
        if (!empty($input['metadata'])) {
            $model->metaCreateOrUpdate($input['metadata']);
        }
        $model->updateSlugTranslation();

        $locales = \Config::get('translatable.locales');

        foreach($locales as $locale){
            if(!empty($input[$locale]['slug'])){
                $slug = $input[$locale]['slug'];
                DB::table('project_category_translations')
                    ->where('project_category_id', $id)->where('locale', $locale)
                    ->update(['slug' => $slug]);
            }
        }
        
        return $model;
    }


}
