<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\TranslateUrl;
use App\Models\City;
use App\Repositories\ProjectCategoryRepository;
use App\Repositories\ProjectRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProjectController extends Controller
{
    private $category;
    private $project;
    public function __construct(ProjectCategoryRepository $category, ProjectRepository $project)
    {
        $this->category = $category;
        $this->project = $project;
        \Breadcrumb::add(trans('frontend.our_businesses'), getPageUrlByCode('MODEL') );
        \Breadcrumb::add(trans('frontend.property_type'), getPageUrlByCode('PROPERTY-TYPE') );
    }

    public function getProjectCategoryDetail($slug)
    {
        $project_category = $this->category->findBySlug($slug);
        \Breadcrumb::add($project_category->name, request()->url());
        $projects = $project_category->project()->where('active', 1)->paginate(9);
        $metadata = $project_category->meta;
        foreach ($project_category->translations as $translation) {
            TranslateUrl::addWithLink($translation->locale, \LaravelLocalization::getURLFromRouteNameTranslated($translation->locale, 'routes.project_category', ['slug'=>$translation->slug]));
        }

        return view('frontend.about.project_category_detail',compact('project_category','projects', 'metadata'));
    }

    public function getProjectDetail($slug)
    {
        $project = $this->project->findBySlug($slug);
        $metadata = $project->meta;
        \Breadcrumb::add($project->category->name, route('frontend.project_category_detail',['slug'=>$project->category->slug]));
        \Breadcrumb::add($project->name, request()->url());

        foreach ($project->translations as $translation) {
            TranslateUrl::addWithLink($translation->locale, \LaravelLocalization::getURLFromRouteNameTranslated($translation->locale, 'routes.project', ['slug'=>$translation->slug]));
        }

        return view('frontend.about.project_detail',compact('project', 'metadata'));
    }
}
