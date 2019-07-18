<?php

namespace App\Repositories;

use App\Models\NewsCategory;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use DB;

/**
 * Class FaqCategoryRepositoryEloquent
 * @package namespace App\Repositories;
 */
class NewsCategoryRepositoryEloquent extends BaseRepository implements NewsCategoryRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return NewsCategory::class;
    }

    /**
    * Specify Validator class name
    *
    * @return mixed
    */
    public function validator()
    {
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
        $model = $this->model->find($id);
        $model->update($input);
        if (!empty($input['metadata'])) {
            $model->metaCreateOrUpdate($input['metadata']);
        }
        $model->updateSlugTranslation();
        $locales = \Config::get('translatable.locales');

        foreach($locales as $locale){
            if(!empty($input[$locale]['slug'])){
                $slug = $input[$locale]['slug'];
                DB::table('news_category_translation')
                    ->where('news_category_id', $id)->where('locale', $locale)
                    ->update(['slug' => $slug]);
            }
        }
        return $model;
    }

    public function menuCategories()
    {
        return $this->model->select('*')->withTranslation()
                ->where('code', '<>', 'LEGAL-DOCUMENTS') //khac voi tai-lieu-phap-ly
                ->orderBy('position', 'asc')
                ->orderBy('id', 'asc')
                ->get();
    }

    public function findBySlug($slug)
    {
        $locale = \App::getLocale();
        return $this->model
            ->whereTranslation('slug', $slug, $locale)
            ->with('translations')
            ->firstOrFail();
    }

    public function findCategoryByCode($code)
    {
        $model = $this->model->select('*')
            ->requiredTranslation()
            ->withTranslation()
            ->orderBy('position', 'desc');

        if ($code) {
            $model->where('code', $code);
        }

        return $model->firstOrFail();
    }   
}
