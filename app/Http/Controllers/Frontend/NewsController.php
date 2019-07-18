<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\TranslateUrl;
use App\Http\Controllers\Controller;
use App\Models\Catalogue;
use App\Models\Page;
use App\Models\Slider;
use App\Repositories\CatalogueRepository;
use App\Repositories\NewsRepository;
use App\Repositories\NewsCategoryRepository;
use Breadcrumb;
use DB;
use App;

class NewsController extends Controller
{
    protected $news;
    protected $news_category;

    public function __construct(
        NewsRepository $news,
        NewsCategoryRepository $news_category
    )
    {
        $this->news = $news;
        $this->news_category = $news_category;

        $link = getPageUrlByCode('MEDIA-INDEX');
        Breadcrumb::add(trans('frontend.media_center'), $link);

        Breadcrumb::add(trans('frontend.news'), getPageUrlByCode('MEDIA-INDEX'));
    }

    public function getNewsCategory($parent_slug, $slug = null)
    {
        $news_category_parent = $this->news_category->findBySlug($parent_slug);
        Breadcrumb::add($news_category_parent->name, route('media.news.category',['parent_slug'=>$news_category_parent->slug]));
        $slug = $slug ?? $news_category_parent->child()->first()->slug;

        $news_category = $this->news_category->findBySlug($slug);
        Breadcrumb::add($news_category->name, route('media.news.category',['parent_slug'=>$news_category_parent->slug,'slug'=>$news_category->slug]));
        $news = $news_category->news()->paginate(12);

        foreach ($news_category_parent->translations as $translation) {
            TranslateUrl::addWithLink($translation->locale, \LaravelLocalization::getURLFromRouteNameTranslated($translation->locale, 'routes.media_center_news_category', ['parent_slug'=>$translation->slug]));
        }
        $metadata = $news_category->meta;
        return view('themes.media_news_list',compact('news_category_parent','news_category','news','metadata'));
    }

    public function getNewsDetail($slug)
    {
        $get_locale = App::getLocale();
        $news = $this->news->findBySlug($slug);
        $news_relative = $this->news->datatable()->where('id','!=',$news->id)->limit(10)->get();
        Breadcrumb::add( $news->title, url()->current());
        $metadata = DB::table('metadata')
            ->join('metadata_translations', 'metadata.id', '=', 'metadata_translations.metadata_id')
            ->where('metadata.object_id',$news->id)
            ->where('meta_key', 'news')
            ->where('metadata_translations.locale', $get_locale)
            ->first();
        foreach ($news->translations as $translation) {
            TranslateUrl::addWithLink($translation->locale, \LaravelLocalization::getURLFromRouteNameTranslated($translation->locale, 'routes.media_center_news_detail', ['slug'=>$translation->slug]));
        }

        return view('themes.media_news_detail',compact('news','news_relative','metadata'));
    }
}
