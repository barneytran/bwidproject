<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\TranslateUrl;
use App\Http\Controllers\Controller;
use App\Models\Catalogue;
use App\Models\Page;
use App\Models\Slider;
use App\Repositories\CatalogueRepository;
use App\Repositories\ServiceRepository;
use App\Repositories\ServiceCategoryRepository;
use Breadcrumb;

class ServiceController extends Controller
{
    protected $service;

    public function __construct(
        ServiceRepository $service
    )
    {
        $this->service = $service;

        $link = getPageUrlByCode('MODEL');
        Breadcrumb::add(trans('frontend.our_businesses'), $link);

        $title = getPageUrlByCode('WHY', 'title');
        Breadcrumb::add($title, getPageUrlByCode('WHY'));
    }

    public function getServiceDetail($slug)
    {
        $service = $this->service->findBySlug($slug);
        Breadcrumb::add( $service->title, url()->current());
        $metadata = $service->meta;
        foreach ($service->translations as $translation) {
            TranslateUrl::addWithLink($translation->locale, \LaravelLocalization::getURLFromRouteNameTranslated($translation->locale, 'routes.service', ['slug'=>$translation->slug]));
        }

        return view('themes.why_vietnam_detail',compact('service', 'metadata'));
    }
}
