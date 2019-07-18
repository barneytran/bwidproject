<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\TranslateUrl;
use App\Models\City;
use App\Repositories\ProjectCategoryRepository;
use App\Repositories\ProjectRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PropertyLeasingController extends Controller
{
    private $category;
    private $project;
    public function __construct(ProjectCategoryRepository $category, ProjectRepository $project)
    {
        $this->category = $category;
        $this->project = $project;

        $slug = getPageUrlByCode('PROPERTY-FOR-LEASE');

        \Breadcrumb::add( getPageUrlByCode('PROPERTY-FOR-LEASE','title'), $slug );
    }

    public function getPropertyLeasing(Request $request)
    {
        $cities = City::has('branches')->get();
        $projects = $this->project->datatable();

        if($category_id = $request->get('category_id')){
            $projects->where('category_id',$category_id);
        }

        if($city_id = $request->get('city_id')){
            $projects->whereHas('branches',function ($query) use ($city_id){
                $query->where('branch.city_id',$city_id);
            });
        }

        $projects = $projects->paginate(9);

        foreach (getSupportedLocales() as $locale=>$value) {
            TranslateUrl::addWithLink($locale, \LaravelLocalization::getURLFromRouteNameTranslated($locale, 'routes.property_leasing_property_for_lease'));
        }

        $slug = getPageUrlByCode('PROPERTY-FOR-LEASE-SUB');
        \Breadcrumb::add(getPageUrlByCode('PROPERTY-FOR-LEASE-SUB','title'), $slug);
        return view('frontend.property_leasing.property_for_lease',compact('cities','projects'));
    }
}
