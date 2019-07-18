<?php
Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect']
    ],
    function () {
        Route::group(["prefix" => "admin"], function () {

            Auth::routes();

            Route::group(['middleware' => ['auth', "permission:admin.index"]], function () {

                Route::get('/', 'DashboardController@index')->name("admin.dashboard.index")->middleware("permission:admin.index");

                // Products
                Route::put('products/{id}/sort-photo', 'ProductController@sortPhoto')->name("admin.product.photo.sort")->middleware("permission:admin.product.edit");
                Route::get('products/create/load-block', 'ProductController@loadBlock')->name("admin.product.load.block")->middleware("permission:admin.product.create", 'permission:admin.product.edit');
                resourceAdmin('products', 'ProductController', 'product');

                // News
                resourceAdmin('news-categories', 'NewsCategoryController', 'news_category', 'news.category');
                resourceAdmin('news', 'NewsController', 'news');

                // Service
                resourceAdmin('service', 'ServiceController', 'service');

                // Resource
                resourceAdmin('brochures', 'BrochuresController', 'brochures');

                // Career
                Route::group(['prefix' => 'careers'], function () {
                    Route::get('application-list', 'CareerController@application')->name("admin.career.application")->middleware("permission:admin.career.application");
                    Route::get('application-list-datatable', 'CareerController@applicationDatatable')->name("admin.career.application.datatable")->middleware("permission:admin.career.application");

                    resourceAdmin('categories', 'CareerCategoryController', 'career_category', 'career');
                });
                resourceAdmin('careers', 'CareerController', 'career');

                // Contact
                resourceAdmin('contacts', 'ContactController', 'contact', 'contact', ['show', 'edit', 'create']);
                Route::get('contacts/export/excel','ContactController@export_excel')->name('admin.contact.export_excel');

                // Subscribe
                resourceAdmin('subscribe', 'SubscribeController', 'subscribe', 'subscribe', ['show', 'edit', 'create']);
                Route::get('subscribe/export/excel','SubscribeController@export_excel')->name('admin.subscribe.export_excel');

                // Register
                resourceAdmin('register', 'RegisterController', 'register', 'register', ['show', 'edit', 'create']);
                Route::get('register/export/excel','RegisterController@export_excel')->name('admin.register.export_excel');

                // Rfp
                resourceAdmin('rfps', 'RfpController', 'rfp', 'rfp', ['show', 'edit', 'create']);

                // Page
                resourceAdmin('themes', 'ThemeController', 'theme');
                Route::get('pages/create/load-block', 'PageController@loadBlock')->name("admin.page.load.block")->middleware("permission:admin.page.create", 'permission:admin.page.edit');
                resourceAdmin('pages', 'PageController', 'page');

                resourceAdmin('partners', 'PartnerController', 'partner');

                resourceAdmin('team', 'TeamController', 'team');

                Route::get('image-maps/point-edit/{id}', 'ImageMapController@editPoint')->name("admin.page.point.edit")->middleware('permission:admin.image.map.edit');
                Route::put('image-maps/point-edit/{id}', 'ImageMapController@updatePoint')->name("admin.page.point.update")->middleware('permission:admin.image.map.edit');
                resourceAdmin('image-maps', 'ImageMapController', 'image_map', 'image.map');

                resourceAdmin('sliders', 'SliderController', 'slider');

                // FAQ
                resourceAdmin('faqs/categories', 'FaqCategoryController', 'faq_category', 'faq');
                resourceAdmin('faqs/customer-questions', 'FaqQuestionController', 'faq_question', 'faq', ['show', 'edit', 'create']);
                resourceAdmin('faqs', 'FaqController', 'faq');

                resourceAdmin('visit-registration', 'RegisterSightseeingController', 'register_sightseeing', 'visit.registration', ['create', 'edit']);

                resourceAdmin('users', 'UserController', 'user');

                resourceAdmin('roles', 'RoleController', 'role');

                resourceAdmin('system', 'SystemController', 'system', 'system', ['show', 'index', 'create', 'destroy']);

                //E-catalog
                resourceAdmin('catalogue', 'CatalogController', 'catalogue');

                // Project
                resourceAdmin('project-categories', 'ProjectCategoryController', 'project_category', 'project.category');
                resourceAdmin('projects', 'ProjectController', 'project');


               Route::group(['prefix' => 'branches'], function () {
                   Route::get('ajax-get-parents', 'BranchController@ajaxGetParents')->name("admin.branch.ajax_get_parents")->middleware("permission:admin.branch.create");
               });
               resourceAdmin('branches', 'BranchController', 'branch');
               Route::put('branches/update/map-image','BranchController@updateMapImage')->name('branch.map_image');

                /*
             Route::put('product-categories/update_status/{id}', 'ProductCategoryController@updateStatus')->name("admin.product_category.update_status")->middleware("permission:admin.product.category.edit");
             Route::put('product-categories/sort', 'ProductCategoryController@sort')->name("admin.product_category.sort")->middleware("permission:admin.product.category.edit");
             Route::put('product-categories/sort', 'ProductCategoryController@sort')->name("admin.product_category.sort")->middleware("permission:admin.product.category.edit");
             resourceAdmin('product-categories', 'ProductCategoryController', 'product_category', 'product.category');

             */

               //gallery: image/video
               resourceAdmin('gallery', 'GalleryController', 'gallery');
               Route::put('gallery/{id}/sort-photo', 'GalleryController@sortPhoto')->name("admin.gallery.photo.sort")->middleware("permission:admin.gallery.edit");
            });
        });
    });
