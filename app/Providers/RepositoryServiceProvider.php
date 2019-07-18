<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(\App\Repositories\NewsCategoryRepository::class, \App\Repositories\NewsCategoryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CareerRepository::class, \App\Repositories\CareerRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CareerApplyRepository::class, \App\Repositories\CareerApplyRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\ProductRepository::class, \App\Repositories\ProductRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\ProductCategoryRepository::class, \App\Repositories\ProductCategoryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\NewsCategoryRepository::class, \App\Repositories\NewsCategoryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\NewsRepository::class, \App\Repositories\NewsRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\BranchRepository::class, \App\Repositories\BranchRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\ContactRepository::class, \App\Repositories\ContactRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\SystemRepository::class, \App\Repositories\SystemRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\PageRepository::class, \App\Repositories\PageRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\FaqRepository::class, \App\Repositories\FaqRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\FaqCategoryRepository::class, \App\Repositories\FaqCategoryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\UserRepository::class, \App\Repositories\UserRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\RoleRepository::class, \App\Repositories\RoleRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\SliderRepository::class, \App\Repositories\SliderRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\PartnerRepository::class, \App\Repositories\PartnerRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\ThemeRepository::class, \App\Repositories\ThemeRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CountryRepository::class, \App\Repositories\CountryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\RegisterSightRepository::class, \App\Repositories\RegisterSightRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\FaqQuestionRepository::class, \App\Repositories\FaqQuestionRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CareerFormRepository::class, \App\Repositories\CareerFormRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CareerCategoryRepository::class, \App\Repositories\CareerCategoryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CareerLevelRepository::class, \App\Repositories\CareerLevelRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CareerDegreeRepository::class, \App\Repositories\CareerDegreeRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\GalleryRepository::class, \App\Repositories\GalleryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\CatalogueRepository::class, \App\Repositories\CatalogueRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\RfpRepository::class, \App\Repositories\RfpRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\BrochuresRepository::class, \App\Repositories\BrochuresRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\TeamRepository::class, \App\Repositories\TeamRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\SubscribeRepository::class, \App\Repositories\SubscribeRepositoryEloquent::class);

        $this->app->bind(\App\Repositories\ProjectCategoryRepository::class, \App\Repositories\ProjectCategoryRepositoryEloquent::class);
        $this->app->bind(\App\Repositories\ProjectRepository::class, \App\Repositories\ProjectRepositoryEloquent::class);

        $this->app->bind(\App\Repositories\ImageMapRepository::class, \App\Repositories\ImageMapRepositoryEloquent::class);

        $this->app->bind(\App\Repositories\ServiceRepository::class, \App\Repositories\ServiceRepositoryEloquent::class);
        //:end-bindings:
    }
}
