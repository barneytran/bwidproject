<?php

namespace App\Providers;

use App\Http\ViewComposers\GlobalComposer;
use App\Models\Partner;
use App\Repositories\PartnerRepository;
use App\Repositories\PartnerRepositoryEloquent;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;

class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('*', function ($view) {
            $locales = \LaravelLocalization::getSupportedLocales();
            $view->with('composer_locales', $locales);
            $view->with('composer_locale', \App::getLocale());
        });

        View::composer([
            'frontend.*',
            'themes.*'
        ], GlobalComposer::class);

        // Admin permission
        View::composer([
            'admin.layouts.partials.menu',
            'admin.dashboard.index',
        ], function ($view) {
            $auth = \Auth::user();
            $value = [];
            if($auth){
                $value =  $auth->getPermissions()->pluck('slug')->toArray();
            }

            $view->with('composer_auth_permissions', $value);
        });
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
