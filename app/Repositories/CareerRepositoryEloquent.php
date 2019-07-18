<?php

namespace App\Repositories;

use App\Models\CareerCategory;
use App\Traits\UploadPhotoTrait;
use Carbon\Carbon;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\CareerRepository;
use App\Models\Career;
use App\Validators\CareerValidator;
use DB;

/**
 * Class CareerRepositoryEloquent
 *
 * @package namespace App\Repositories;
 */
class CareerRepositoryEloquent extends BaseRepository implements CareerRepository
{
    use UploadPhotoTrait;

    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Career::class;
    }

    /**
     * Specify Validator class name
     *
     * @return mixed
     */
    public function validator()
    {
        return CareerValidator::class;
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

        $input['published_date'] = !empty($input['publish_at']) ? cvDbTime($input['publish_at'], PHP_DATE, DB_DATE) : date("Y-m-d");

        $input['expired_date'] = !empty($input['expired_date']) ? cvDbTime($input['expired_date'], PHP_DATE, DB_DATE) : date("Y-m-d");

        $input['is_top'] = !empty($input['is_top']) ? 1 : 0;  

        $input['accept_aplly'] = !empty($input['accept_aplly']) ? 1 : 0;

        $model = $this->model->create($input);

        if (!empty($input['metadata'])) {
            $model->metaCreateOrUpdate($input['metadata']);
        }

        $model->updateSlugTranslation();

        $model->cities()->sync($input['cities']);

        return $model;
    }

    public function update(array $input, $id)
    {
        $model = $this->model->findOrFail($id);

        $input['is_top'] = !empty($input['is_top']) ? 1 : 0;

        $input['accept_aplly'] = !empty($input['accept_aplly']) ? 1 : 0;

        $input['published_date'] = !empty($input['publish_at']) ? cvDbTime($input['publish_at'], PHP_DATE, DB_DATE) : date("Y-m-d");

        $input['expired_date'] = !empty($input['expired_date']) ? cvDbTime($input['expired_date'], PHP_DATE, DB_DATE) : date("Y-m-d");

        $model->update($input);

        if (!empty($input['metadata'])) {
            $model->metaCreateOrUpdate($input['metadata']);
        }

        $model->updateSlugTranslation();

        $locales = \Config::get('translatable.locales');

        foreach($locales as $locale){
            if(!empty($input[$locale]['slug'])){
                $slug = $input[$locale]['slug'];
                DB::table('career_translation')
                    ->where('career_id', $id)->where('locale', $locale)
                    ->update(['slug' => $slug]);
            }
        }

        $model->cities()->sync($input['cities']);

        return $model;
    }

    public function delete($id)
    {
        $model = $this->model->findOrFail($id);
        $model->delete();
    }

    public function search(array $input)
    {
        $date = Carbon::now()->toDateString();

        $model = $this->model->select('*')
            ->requiredTranslation('name')
            ->withTranslation()
            ->where('employer','LHC')
            ->where('expired_date', '>=', $date)
            ->where('status','PUBLISH')
            ->orderBy('is_top', 'desc')
            ->orderBy('published_date', 'desc');

        if ( !empty($input['k']) ) {
            
            $search_key = trim($input['k']);
            $model->whereTranslationLike('name', '%' . $search_key . '%');
        }

        if (!empty($input['c'])) {
            $model->where('category_id', $input['c']);
        }

        return $model->paginate(10);
    }

    public function findBySlug($slug)
    {   
        $date = Carbon::now()->toDateString();

        $locale = \App::getLocale();
        return $this->model
            ->whereTranslation('slug', $slug, $locale)
            ->with('translations')
            ->with('category')
            ->firstOrFail();
    }

    public function related($careers)
    {   
        $date = Carbon::now()->toDateString();

        $model = $this->model->select('*')
            ->requiredTranslation()
            ->where('expired_date', '>=', $date)
            ->withTranslation()
            ->where('status','PUBLISH');

            if($careers){
                $model->where('employer', $careers->employer)
                        ->where('id', '<>', $careers->id);
            }

            $model->orderBy('is_top', 'desc')
            ->orderBy('published_date', 'desc');

            return $model->get();
    }

    public function apply(array $input)
    {
        $career = $this->model->findOrFail($input['career_id']);

        if (!empty($input['attach_file'])) {
            $config = config('files.career_apply_resume');

            $path = \Storage::putFile($config['path'], $input['attach_file']);

            $input['attach_file'] = $path;
        }

        $apply = $career->applies()->create($input);

        return $apply;
    }


    public function listCareers()
    {   
        $date = Carbon::now()->toDateString();

        return $this->model->requiredTranslation()
            ->withTranslation()
            ->where('expired_date', '>=', $date)
            ->orderBy('employer', 'asc')
            ->orderBy('is_top', 'desc')
            ->orderBy('published_date', 'asc')
            ->get();
    }

}
