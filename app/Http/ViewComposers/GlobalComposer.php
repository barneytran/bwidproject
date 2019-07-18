<?php

namespace App\Http\ViewComposers;

use App\Repositories\NewsRepository;
use App\Repositories\PageRepository;
use App\Repositories\PageRepositoryEloquent;
use App\Repositories\PartnerRepository;
use App\Repositories\ProductRepository;
use App\Repositories\NewsCategoryRepository;
use App\Repositories\ProjectCategoryRepository;
use Illuminate\View\View;

class GlobalComposer
{
    /**
     * The user repository implementation.
     *
     * @var UserRepository
     */
    protected $news_category;
    protected $page;
    protected $project_category;
    protected $partner;


    public function __construct(NewsCategoryRepository $news_category, PageRepository $page, ProjectCategoryRepository $project_category)
    {
        $this->news_category = $news_category;
        $this->page = $page;
        $this->project_category = $project_category;
    }

    /**
     * Bind data to the view.
     *
     * @param  View $view
     * @return void
     */
    public function compose(View $view)
    {
        $project_category = $this->project_category->datatable()->orderBy('position')->where('active',1)->limit(4)->get();
        $news_categories_root = $this->news_category->datatable()->orderBy('position')->where('parent_id',0)->get();

        $view->with('composer_project_category', $project_category);
        $view->with('composer_news_categories_root', $news_categories_root);
    }
}
