<?php

namespace App\Repositories;

use App\Traits\RepositoryTrait;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\ProjectRepository;
use App\Models\Project;
use App\Validators\ProjectValidator;
use DB;

/**
 * Class ProjectRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class ProjectRepositoryEloquent extends BaseRepository implements ProjectRepository
{
    use RepositoryTrait;
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Project::class;
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
        $input['active'] = !empty($input['active']) ? 1 : 0;
        if(isset($input['photos']) && is_array($input['photos']))
            $input['pictures'] = json_encode($input['photos']);

        if(isset($input['features']) && is_array($input['features']))
            $input['features'] = json_encode(array_diff_key($input['features'],array_flip(['RAND'])));

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
        $input['active'] = !empty($input['active']) ? 1 : 0;
        if(isset($input['photos']) && is_array($input['photos']))
            $input['pictures'] = json_encode($input['photos']);

        if(isset($input['features']) && is_array($input['features']))
            $input['features'] = json_encode(array_diff_key($input['features'],array_flip(['RAND'])));

        $model->update($input);
        if (!empty($input['metadata'])) {
            $model->metaCreateOrUpdate($input['metadata']);
        }
        $model->updateSlugTranslation();

        $locales = \Config::get('translatable.locales');

        foreach($locales as $locale){
            if(!empty($input[$locale]['slug'])){
                $slug = $input[$locale]['slug'];
                DB::table('project_translations')
                    ->where('project_id', $id)->where('locale', $locale)
                    ->update(['slug' => $slug]);
            }
        }

        return $model;
    }

}
