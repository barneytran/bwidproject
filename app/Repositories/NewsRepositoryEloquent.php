<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\NewsRepository;
use App\Models\News;
use App\Validators\NewsValidator;
use DB;

/**
 * Class NewsRepositoryEloquent
 *
 * @package namespace App\Repositories;
 */
class NewsRepositoryEloquent extends BaseRepository implements NewsRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return News::class;
    }

    /**
     * Specify Validator class name
     *
     * @return mixed
     */
    public function validator()
    {
        return NewsValidator::class;
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
        $input['is_top'] = !empty($input['is_top']) ? 1 : 0;
        $input['publish_at'] = !empty($input['publish_at']) ? cvDbTime($input['publish_at'], PHP_DATE, DB_DATE) : date("Y-m-d");

        $news = $this->model->create($input);

        if (!empty($input['metadata'])) {
            $news->metaCreateOrUpdate($input['metadata']);
        }

        $news->updateSlugTranslation();

        return $news;
    }

    public function update(array $input, $id)
    {
        $news = $this->model->findOrFail($id);

        $input['active'] = !empty($input['active']) ? 1 : 0;
        $input['is_top'] = !empty($input['is_top']) ? 1 : 0;
        $input['publish_at'] = !empty($input['publish_at']) ? cvDbTime($input['publish_at'], PHP_DATE, DB_DATE) : date("Y-m-d");

        $news->update($input);

        $news->updateSlugTranslation();

        $locales = \Config::get('translatable.locales');

        foreach($locales as $locale){
            if(!empty($input[$locale]['slug'])){
                $slug = $input[$locale]['slug'];
                DB::table('news_translation')
                    ->where('news_id', $id)->where('locale', $locale)
                    ->update(['slug' => $slug]);
            }
        }

        if (!empty($input['metadata'])) {
            $news->metaCreateOrUpdate($input['metadata']);
        }

        return $news;
    }

    public function delete($id)
    {
        $news = $this->model->findOrFail($id);

        $news->meta()->delete();

        $news->delete();

        return true;
    }

    //function show news in pagehome
    public function listNews($limit = 0, $is_top = false)
    {
        $model = $this->model->active()
            ->requiredTranslation()
            ->with('category')
            ->whereHas('category', function ($q){
                $q->where('code', '<>', 'LEGAL-DOCUMENTS'); //khac voi tai-lieu-phap-ly
            })
            ->withTranslation();
        if ($is_top) {
            $model->orderBy('is_top', 'desc');
        }
        $model->orderBy('is_top', 'desc')
            ->orderBy('publish_at', 'desc');

        if ($limit) {
            return $model->limit($limit)
                ->get();
        }
        return $model->paginate(15);
    }

    public function findBySlug($slug)
    {
        $locale = \App::getLocale();
        $model = $this->model->active()
            ->requiredTranslation()
            ->whereTranslation('slug', $slug, $locale)
            ->with('translations')
            ->firstOrFail();
        return $model;
    }

    public function newsByCategory($category_id, $limit, $ignore = null, $paginate = false)
    {
        $model = $this->model->select('*')
            ->active()
            ->requiredTranslation()
            ->withTranslation()
            ->with('category');
        if ($category_id) {
            $model->where('news_category_id', $category_id);
        }
        if (!empty($ignore)) {
            if (is_array($ignore)) {
                $model->whereNotIn('id', $ignore);
            } else {
                $model->where('id', '!=', $ignore);
            }
        }
        $model->orderBy('is_top', 'desc')
            ->orderBy('news.publish_at', 'desc');
        if ($paginate) {
            return $model->paginate($limit);
        }
        return $model->limit($limit)->get();
    }


    public function topNews($limit = 0, $is_top = false)
    {
        $locale = \App::getLocale();
        $model = $this->model->select('*')->active()
            ->requiredTranslation()
            ->withTranslation()
            ->whereHas('translations', function ($q) use ($locale) {
                $q->where('locale', '=', $locale)->whereNotNull('title')->whereNotNull('content');
            });

        if ($is_top) {
            $model->orderBy('is_top', 'desc');
        }

        $model->orderBy('is_top', 'desc')
            ->orderBy('publish_at', 'desc')
            ->get();

        return $model->limit($limit)->get();
    }

    public function get_available_news($model)
    {
        return $model->orderByDesc('created_at')->orderByDesc('is_top')->where('publish_at', '<=', date('Y-m-d'));
    }

    public function newsInPage($limit)
    {
        $locale = \App::getLocale();
        $first_news = $this->get_available_news($this->model)->first();

        $model = $this->model->select('*')->active()
            ->requiredTranslation()
            ->withTranslation()
            ->whereHas('translations', function ($q) use ($locale) {
                $q->where('locale', '=', $locale)->whereNotNull('title')->whereNotNull('content');
            });


        if ($first_news) {
            $model->where('id','!=',$first_news->id);
        }

        $model = $this->get_available_news($model)->paginate($limit);

        return [
            'first_news'=>$first_news,
            'list_news'=>$model
        ];
    }

    public function relative_news(int $current_news_id)
    {
        $collection = $this->get_available_news($this->model)->get();

        $next = null;
        $previous = null;
        foreach ($collection as $index=>$value)
        {
            if($value->id == $current_news_id)
            {
                if($index)
                    $previous = $collection[$index-1];
                if($index < count($collection)-1)
                    $next = $collection[$index+1];
                break;
            }
        }

        return compact('next','previous');
    }

    public function search(array $input)
    {
        $model = $this->model->select('*', \DB::raw('"news" as table_type'))
            ->active()
            ->requiredTranslation()
            ->where(function ($q) use ($input) {
                if (!empty($input['key'])) {
                    $q->whereTranslationLike('title', '%' . $input['key'] . '%')
                        ->orWhereTranslationLike('description', '%' . $input['key'] . '%')
                        ->orWhereTranslationLike('content', '%' . $input['key'] . '%');
                }
            })
            ->withTranslation();

        $model->orderBy('id', 'desc');

        return $model->limit(1000)->get();
    }
}
