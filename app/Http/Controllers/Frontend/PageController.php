<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\Search;
use App\Helper\TranslateUrl;
use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\ContactRequest;
use App\Jobs\SendContactEmailJob;
use App\Models\City;
use App\Models\Page;
use App\Models\PageBlock;
use App\Repositories\BranchRepository;
use App\Repositories\BrochuresRepository;
use App\Repositories\CareerCategoryRepository;
use App\Repositories\CareerRepository;
use App\Repositories\ContactRepository;
use App\Repositories\CountryRepository;
use App\Repositories\FaqCategoryRepository;
use App\Repositories\FaqQuestionRepository;
use App\Repositories\GalleryRepository;
use App\Repositories\NewsRepository;
use App\Repositories\PageRepository;
use App\Repositories\PartnerRepository;
use App\Repositories\ProductRepository;
use App\Repositories\ProjectCategoryRepository;
use App\Repositories\ProjectRepository;
use App\Repositories\RfpRepository;
use App\Repositories\ServiceRepository;
use App\Repositories\SliderRepository;
use App\Repositories\SystemRepository;
use App\Repositories\TeamRepository;
use Breadcrumb;
use function GuzzleHttp\Psr7\str;
use Illuminate\Http\Request;
use Mail;

class PageController extends Controller
{
    private $page;
    private $product;
    private $project_category;
    private $project;
    private $news;
    private $partner;
    private $contact;
    private $rfp;
    private $faqquest;
    private $faqcate;
    private $country;
    private $slider;
    private $brochures;
    private $team;
    private $system;
    private $branch;
    private $gallery;
    private $career;
    private $service;
    protected $category;

    public function __construct(
        PageRepository $page,
        ProductRepository $product,
        ProjectCategoryRepository $project_category,
        ProjectRepository $project,
        NewsRepository $news,
        PartnerRepository $partner,
        ContactRepository $contact,
        RfpRepository $rfp,
        FaqQuestionRepository $faqquest,
        FaqCategoryRepository $faqcate,
        CountryRepository $country,
        SliderRepository $slider,
        BrochuresRepository $brochures,
        TeamRepository $team,
        SystemRepository $system,
        BranchRepository $branch,
        GalleryRepository $gallery,
        CareerRepository $career,
        ServiceRepository $service,
        CareerCategoryRepository $category
    )
    {
        $this->page = $page;
        $this->product = $product;
        $this->project_category = $project_category;
        $this->project = $project;
        $this->news = $news;
        $this->partner = $partner;
        $this->contact = $contact;
        $this->rfp = $rfp;
        $this->faqquest = $faqquest;
        $this->faqcate = $faqcate;
        $this->country = $country;
        $this->slider = $slider;
        $this->brochures = $brochures;
        $this->team = $team;
        $this->system = $system;
        $this->branch = $branch;
        $this->gallery = $gallery;
        $this->career = $career;
        $this->service = $service;
        $this->category = $category;
    }

    public function index()
    {
        $page = $this->page->findBySlug('/');
        $blocks = [];
        if ($page->parentBlocks->count()) {
            $blocks = $page->parentBlocks->groupBy('code');
        }
        foreach ($page->translations as $translation) {
            TranslateUrl::addWithLink($translation->locale, "/{$translation->locale}");
        }
        $metadata = $page->meta;
        $sliders = $this->slider->datatable()->where('key',SLIDER_HOME)->get();
        $partners = $this->partner->partner_frontend();

        $branches = $this->branch->datatable()->orderBy('city_id')->get()->groupBy('city_id');
        $cities = City::has('branches')->get();

        $projects = $this->project->datatable()->limit(3)->get();

        if (view()->exists(THEME_PATH_VIEW . ".{$page->theme}")) {
            return view(THEME_PATH_VIEW . ".{$page->theme}", compact('page', 'blocks', 'metadata','sliders','partners', 'branches', 'cities', 'projects'));
        }
        return abort(404);
    }

    public function show($slug)
    {
        $with = [
            'translations',
            'parentBlocks',
            'parentBlocks.children',
            'meta'
        ];

        $page = $this->page->findBySlug($slug, $with);

        $blocks = collect();

        if ($page->parentBlocks->count()) {
            $blocks = $page->parentBlocks->groupBy('code');
        }

        foreach ($page->translations as $translation) {
            $url = $translation->slug ? $translation->slug : COMING_SOON;
            TranslateUrl::addWithLink($translation->locale, "/{$translation->locale}/{$url}");
        }

        $metadata = $page->meta;

        if (!$metadata || !$metadata->title) {
            $metadata = (object)[
                'title' => $page->title,
                'description' => $page->description,
                'key_word' => '3forcom'
            ];
        }

        $lang = app()->getLocale();

        if (view()->exists(THEME_PATH_VIEW . ".{$page->theme}")) {
            $with = [];

            switch ($page->group_code)
            {
                case 'ABOUT':{
                    $link = getPageUrlByCode('ABOUT');
                    Breadcrumb::add(trans('menu.about_us'), $link);
                } break;

                case 'BUSINESS':{
                    $link = getPageUrlByCode('MODEL');
                    Breadcrumb::add(trans('frontend.our_businesses'), $link);
                } break;

                case 'MEDIA':{
                    $link = getPageUrlByCode('MEDIA-INDEX');
                    Breadcrumb::add(trans('frontend.media_center'), $link);

                    if(strpos($page->code, 'MEDIA-NEWS') !== false){
                        Breadcrumb::add(trans('frontend.news'), getPageUrlByCode('MEDIA-NEWS-LIST-INVESTOR'));
                    }

                    if(strpos($page->code, 'MEDIA-GALLERY-') !== false){
                        Breadcrumb::add(trans('frontend.gallery'), getPageUrlByCode('MEDIA-GALLERY'));
                    }
                } break;
            }

            switch ($page->theme)
            {
                case 'our_presence':{
                    $branches = $this->branch->datatable()->orderBy('city_id')->get();
                    $with = [
                        'branches' => $branches
                    ];
                } break;

                case 'media_index':{
                    $latest_news = $this->news->datatable()->orderByDesc('publish_at')->limit(4)->get();

                    $investor_news = $this->news->datatable()->whereHas('category', function ($query){
                        $query->where('code','INVESTORS')
                            ->orWhereHas('parent', function ($query1){
                                $query1->where('code','INVESTORS');
                            });
                    })->orderByDesc('publish_at')->limit(9)->get();

                    $bw_news = $this->news->datatable()->whereHas('category', function ($query){
                        $query->where('code','BW')
                            ->orWhereHas('parent',function ($query1){
                                $query1->where('code','BW');
                            });
                    })->orderByDesc('publish_at')->limit(9)->get();

                    $with = [
                        'latest_news' => $latest_news,
                        'investor_news'=>$investor_news,
                        'bw_news'=>$bw_news
                    ];
                } break;

                case 'our_customer': {
                    $slug = getPageUrlByCode('PROPERTY-FOR-LEASE');
                    \Breadcrumb::add( getPageUrlByCode('PROPERTY-FOR-LEASE','title'), $slug );
                    $partners = $this->partner->partner_frontend();
                    $with = [
                        'partners' => $partners
                    ];
                } break;

                case 'case_studies': {
                    $slug = getPageUrlByCode('PROPERTY-FOR-LEASE');
                    \Breadcrumb::add( getPageUrlByCode('PROPERTY-FOR-LEASE','title'), $slug );
                } break;

                case 'media_gallery':{
                    $media_gallery_photo = $this->gallery->datatable()->where('type','IMAGES')->orderBy('position')->orderByDesc('published_date')->limit(9)->get();
                    $media_gallery_video = $this->gallery->datatable()->where('type','VIDEOS')->orderBy('position')->orderByDesc('published_date')->limit(4)->get();

                    $with = [
                        'media_gallery_photo' => $media_gallery_photo,
                        'media_gallery_video'=>$media_gallery_video
                    ];
                } break;

                case 'media_gallery_photo':{
                    $media_gallery_photo = $this->gallery->datatable()->where('type','IMAGES')->orderBy('position')->orderByDesc('published_date')->paginate(9);
                    $with = [
                        'media_gallery_photo' => $media_gallery_photo
                    ];
                } break;

                case 'why_vietnam':{
                    $service_type = $page->code === 'WHY' ? SERVICE_TYPE_WHY_NOW : SERVICE_TYPE_VALUE_ADDED;
                    $services_now = $this->service->datatable()->where('service_type',$service_type)->paginate(9);
                    $with = [
                        'services_now' => $services_now
                    ];
                } break;

                case 'media_gallery_video':{
                    $media_gallery_video = $this->gallery->datatable()->where('type','VIDEOS')->orderBy('position')->orderByDesc('published_date')->paginate(9);
                    $with = [
                        'media_gallery_video' => $media_gallery_video
                    ];
                } break;

                case  'media_news_list':{
                    $category = ($page->code == 'MEDIA-NEWS-LIST-INVESTOR') ? 'INVESTORS' : 'BW';
                    $news = $this->news->datatable()->whereHas('category', function ($query) use ($category){
                        $query->where('code',$category);
                    })->orderByDesc('publish_at')->paginate(9);

                    $with = [
                        'news'=>$news,
                        'category'=>$category
                    ];
                } break;

                case 'about_team':{
                    $teams = $this->team->datatable()->orderBy('order')->get();
                    $with = [
                        'teams' => $teams
                    ];
                } break;

                case 'career_culture':{
                    $sliders = $this->slider->datatable()->where('key',SLIDER_CAREER_CULTURE)->get();
                    $with = [
                        'sliders' => $sliders
                    ];
                } break;

                case 'contact':{
                    $system = $this->system->all()->keyBy('key')->toArray();
                    $with = [
                        'system' => $system
                    ];
                } break;

                case 'property_for_lease':{
                    $cities = City::has('branches')->get();
                    $projects = $this->project->datatable();

                    if($category_id = \request('category_id')){
                        $projects->where('category_id',$category_id);
                    }

                    if($city_id = \request('city_id')){
                        $projects->whereHas('branches',function ($query) use ($city_id){
                            $query->where('branch.city_id',$city_id);
                        });
                    }

                    $projects = $projects->paginate(9);

                    $with = compact('cities','projects');
                } break;

                case 'career_opening':{
                    $cities = City::all();
                    $categories = $this->category->all();
                    $career = $this->career->datatable()->orderByDesc('created_at')->where('status','PUBLISH');

                    if($department_id = \request('department_id')){
                        $career->where('category_id',$department_id);
                    }

                    if($city_id = \request('city_id')){
                        $career->whereHas('cities',function ($query) use ($city_id){
                            $query->where('city.id',$city_id);
                        });
                    }

                    if($q  = \request('q')){
                        $career->whereTranslationLike('name',"%$q%");
                    }

                    $career = $career->get();

                    $with = compact('cities','categories','career');
                } break;
            }

            if ($page->parent_id) {
                $parent = $page->parent;
                if ($parent) {
                    Breadcrumb::add($parent->title, $parent->url);
                }
            }

            Breadcrumb::add($page->title,"$lang/$page->url");
            return view(THEME_PATH_VIEW . ".{$page->theme}", compact('page', 'blocks', 'metadata'))->with($with);
        }
        return abort(404);
    }

    public function storeContact(ContactRequest $request)
    {
   //     if(!checkReCaptcha())
    //        return redirect()->back()->withInput()->with('error',trans('home.r_captcha'));

        $input = $request->all();
        $this->contact->create($input);

        if (\App::environment('production')) {
            $this->dispatch(new SendContactEmailJob($input));
            $locale = \App::getLocale();
//
//            $system_email = \System::content('contact_email', env('CONTACT_EMAIL'));
//
//            //Send to visitor
//            \Mail::to($input['email'])->send(new SendContactEmailConfirm($input, $locale));
//
//            if ($system_email) {
//                //Send to admin
//                \Mail::to($system_email)->send(new SendContactEmail($input, $locale));
//            }
        }

        session()->flash('success', trans('message.contact_sent_success'));
        if($locale == 'en'){
            $locale = '';
        }
        return redirect($locale."/thank-you");
    }

    public function getSearch(Request $request)
    {
        $q = strip_tags($request->get('q'));
        $type = intval($request->get('type',0));
        $collects = collect();

        // On our business
        if(!$type || $type==1)
        {
            $collect1 = collect();
            // Project category
            $project_categories = $this->project_category->datatable()
                ->where('active',1)
                ->where(function ($query) use ($q){
                    $query->whereTranslationLike('name',"%$q%");
                })
                ->orWhere(function ($query) use ($q){
                    $query->whereTranslationLike('description',"%$q%");
                })
                ->get();
            foreach ($project_categories as $project_category)
            {
                $search = new Search();
                $search->type = $search::$TYPE_OUR_BUSINESS;
                $search->url = route('frontend.project_category_detail',['slug'=>$project_category->slug]);
                $search->title = $project_category->name;
                $search->description = strip_tags($project_category->description);
                $collect1 = $collect1->push($search);
            }

            // Project
            $projects = $this->project->datatable()
                ->where('active',1)
                ->where(function ($query) use ($q){
                    $query->whereTranslationLike('name',"%$q%");
                })
                ->orWhere(function ($query) use ($q){
                    $query->whereTranslationLike('description',"%$q%");
                })
                ->get();
            foreach ($projects as $project)
            {
                $search = new Search();
                $search->type = $search::$TYPE_OUR_BUSINESS;
                $search->url = route('frontend.project_detail',['slug'=>$project->slug]);
                $search->title = $project->name;
                $search->description = strip_tags($project->description);
                $collect1 = $collect1->push($search);
            }

            $page_blocks = PageBlock::whereHas('page',function ($query){
                $query->where('group_code','BUSINESS');
            })
                ->where(function ($query) use ($q){
                    $query->where(function ($query1) use ($q){
                        $query1->whereTranslationLike('description',"%$q%");
                    })->orWhere(function ($query1) use ($q){
                        $query1->whereTranslationLike('content',"%$q%");
                    })->orWhere(function ($query1) use ($q){
                        $query1->whereTranslationLike('name',"%$q%");
                    });
                })
                ->get();

            foreach ($page_blocks as $page_block)
            {
                $search = new Search();
                $search->type = $search::$TYPE_OUR_BUSINESS;
                $search->url = $page_block->page->slug;
                $search->title= $page_block->name ?? $page_block->page->title;
                $search->description = strip_tags($page_block->description) ?  strip_tags($page_block->description) : strip_tags($page_block->content);
                $collect1 = $collect1->push($search);
            }

            $collect1 = $collect1->unique('url');
            $collect1_count = $collect1->count();
            $collects = $collects->merge($collect1);
        }

        // On property leasing
        if(!$type || $type==2)
        {
            // Search on page with group_code = PROPERTY-LEASING
            $collect2 = collect();
            $page_blocks = PageBlock::whereHas('page',function ($query){
                $query->where('group_code','PROPERTY-LEASING');
            })
                ->where(function ($query) use ($q){
                    $query->where(function ($query1) use ($q){
                        $query1->whereTranslationLike('description',"%$q%");
                    })->orWhere(function ($query1) use ($q){
                        $query1->whereTranslationLike('content',"%$q%");
                    })->orWhere(function ($query1) use ($q){
                        $query1->whereTranslationLike('name',"%$q%");
                    });
                })
                ->get();

            foreach ($page_blocks as $page_block)
            {
                $search = new Search();
                $search->type = $search::$TYPE_PROPERTY;
                $search->url = $page_block->page->slug;
                $search->title= $page_block->name ?? $page_block->page->title;
                $search->description = strip_tags($page_block->description) ?  strip_tags($page_block->description) : strip_tags($page_block->content);
                $collect2 = $collect2->push($search);
            }

            $collect2 = $collect2->unique('url');
            $collect2_count = $collect2->count();
            $collects = $collects->merge($collect2);
        }

        // On media center
        if(!$type || $type==3)
        {
            $collect3 = collect();

            // Gallery
            $galleries = $this->gallery->datatable()
                ->where(function ($query) use ($q){
                    $query->whereTranslationLike('name',"%$q%");
                })
                ->orWhere(function ($query) use ($q){
                    $query->whereTranslationLike('description',"%$q%");
                })
                ->get();
            foreach ($galleries as $gallery)
            {
                $search = new Search();
                $search->type = $search::$TYPE_MEDIA;
                $search->url = $type == 'IMAGES' ? route('media.gallery.photo.detail',['slug'=>$gallery->slug]) : route('media.gallery.video.detail',['slug'=>$gallery->slug]);
                $search->title = $gallery->name;
                $search->description = strip_tags($gallery->description);
                $collect3 = $collect3->push($search);
            }

            // News
            $news = $this->news->datatable()
                ->where(function ($query) use ($q){
                    $query->whereTranslationLike('title',"%$q%");
                })
                ->orWhere(function ($query) use ($q){
                    $query->whereTranslationLike('description',"%$q%");
                })
                ->get();
            foreach ($news as $news_item)
            {
                $search = new Search();
                $search->type = $search::$TYPE_MEDIA;
                $search->url = $type == route('media.news.detail',['slug'=>$news_item->slug]);
                $search->title = $news_item->title;
                $search->description = strip_tags($news_item->description);
                $collect3 = $collect3->push($search);
            }

            $collect3 = $collect3->unique('url');
            $collect3_count = $collect3->count();
            $collects = $collects->merge($collect3);
        }

        // On careers
        if(!$type || $type==4)
        {
            // Search on page with group_code = CAREER
            $collect4 = collect();
            $page_blocks = PageBlock::whereHas('page',function ($query){
                $query->where('group_code','CAREER');
            })
                ->where(function ($query) use ($q){
                    $query->where(function ($query1) use ($q){
                        $query1->whereTranslationLike('description',"%$q%");
                    })->orWhere(function ($query1) use ($q){
                        $query1->whereTranslationLike('content',"%$q%");
                    })->orWhere(function ($query1) use ($q){
                        $query1->whereTranslationLike('name',"%$q%");
                    });
                })
                ->get();

            foreach ($page_blocks as $page_block)
            {
                $search = new Search();
                $search->type = $search::$TYPE_CAREER;
                $search->url = $page_block->page->slug;
                $search->title= $page_block->name ?? $page_block->page->title;
                $search->description = strip_tags($page_block->description) ?  strip_tags($page_block->description) : strip_tags($page_block->content);
                $collect4 = $collect4->push($search);
            }

            // Current openings -- career
            $careers = $this->career->datatable()
                ->where(function ($query) use ($q){
                    $query->whereTranslationLike('name',"%$q%");
                })
                ->orWhere(function ($query) use ($q){
                    $query->whereTranslationLike('description',"%$q%");
                })
                ->get();
            foreach ($careers as $career)
            {
                $search = new Search();
                $search->type = $search::$TYPE_MEDIA;
                $search->url = $type == route('career.opening.detail',['slug'=>$career->slug]);
                $search->title = $career->name;
                $search->description = strip_tags($career->description);
                $collect4 = $collect4->push($search);
            }

            $collect4 = $collect4->unique('url');
            $collect4_count = $collect4->count();
            $collects = $collects->merge($collect4);
        }


        $collects = $collects->unique('url');
        $total = $collects->count();
        $perPage = 10;
        $pages_count = intval(ceil($total/$perPage));
        $current_page = $request->get('page',1);

        $pages = compact('total','pages_count','current_page');

        $collects = $collects->forPage($current_page,$perPage);

        return view('frontend.search.index',compact('collects','pages', 'collect1_count','collect2_count','collect3_count','collect4_count'));
    }
}
