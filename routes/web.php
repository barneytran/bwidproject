<?php
Route::get('remove-cache', function(){
    removeAllConfig();
    echo 'removed all caching';
});

Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => [
            #'localeSessionRedirect',
            'localizationRedirect'
        ]
    ],
    function () {
        Route::get('/', 'PageController@index')->name('page.home');

        Route::get(trans('routes.project_category'), 'ProjectController@getProjectCategoryDetail')->name('frontend.project_category_detail');
        Route::get(trans('routes.project'),'ProjectController@getProjectDetail')->name('frontend.project_detail');

        Route::post('subscribe/create', 'PageController@subscribe')->name('subscribe.create');
        Route::post('contact', 'PageController@storeContact')->name('page.storeContact');

        Route::get('search', 'PageController@getSearch')->name('page.search');

        Route::get('media-center/gallery/photo/{slug}', 'GalleryController@getPhoto')->name('media.gallery.photo.detail');
        Route::get('media-center/gallery/video/{slug}', 'GalleryController@getVideo')->name('media.gallery.video.detail');

        Route::get(trans('routes.media_center_news_category'), 'NewsController@getNewsCategory')->name('media.news.category');

        Route::get('media-center/news/detail/{slug}', 'NewsController@getNewsDetail')->name('media.news.detail');

        Route::get(trans('routes.career_current_opening'),'CareerController@index')->name('career.opening.index');
        Route::get(trans('routes.career_current_opening_detail'),'CareerController@show')->name('career.opening.detail');

        // Property leasing
        //Route::get(trans('routes.property_leasing_property_for_lease'),'PropertyLeasingController@getPropertyLeasing')->name('property.for_lease');

        Route::get(LaravelLocalization::transRoute('routes.product_index'), 'ProductController@index')->name('product.index');
        Route::get(LaravelLocalization::transRoute('routes.product_show'), 'ProductController@show')->name('product.show');
        Route::get(LaravelLocalization::transRoute('routes.product_book'), 'ProductController@book')->name('product.book');
        Route::post('book-space', 'ProductController@storeBooking')->name('product.storeBooking');

        Route::get(LaravelLocalization::transRoute('routes.product_register'), 'ProductController@registerSightseeing')->name('product.register');
        Route::post('register-sightseeing', 'ProductController@storeRegisterSightseeing')->name('product.storeRegisterSightseeing');

//        /***************
//         * Truyền thông
//         */
//        // Gallery-thu-vien-anh -uu tien truoc tin tuc
//        Route::get(LaravelLocalization::transRoute('routes.library_photo'), 'GalleryController@photos')->name('library_photo.index');
//        Route::get(LaravelLocalization::transRoute('routes.library_photo_show'), 'GalleryController@showPhoto')->name('library_photo.show');
//
//        //Gallery-thu-vien-videos
//        Route::get(LaravelLocalization::transRoute('routes.video_clip'), 'GalleryController@videos')->name('video_clip.index');
//        Route::get(LaravelLocalization::transRoute('routes.video_clip_show'), 'GalleryController@showVideo')->name('video_clip.show');
//
//        //cap-nhat-tai-lieu-phap-ly
//        Route::get(LaravelLocalization::transRoute('routes.legal_documents'), 'NewsController@legaldocuments')->name('legaldocuments');
//        Route::get(LaravelLocalization::transRoute('routes.legal_documents_show'), 'NewsController@showlegal')->name('legaldocuments.show');
//
//        // tin-tuc-phai-sau-dat-gallary
//        Route::get(trans('routes.page_news_detail'), 'NewsController@show')->name('news.show');

        Route::get(trans('routes.page_resources_show'), 'ResourceController@show')->name('resource.show');

        Route::get(LaravelLocalization::transRoute('routes.faqs'), 'PageController@faqs')->name('frontend.faqs');
        Route::post('faqquest', 'PageController@storeFaqquest')->name('page.storeFaqquest');

        //catalogue
        Route::get(LaravelLocalization::transRoute('routes.ebrochure'), 'CatalogueController@index')->name('ebrochure.index');
        Route::get(LaravelLocalization::transRoute('routes.ebrochure_show'), 'CatalogueController@show')->name('ebrochure.show');

        //tuyen-dung
        Route::get(LaravelLocalization::transRoute('routes.career_index'), 'CareerController@index')->name("careers.index"); //mac dinh cho vao lhc
        Route::get(LaravelLocalization::transRoute('routes.career_lhc'), 'CareerController@index')->name("frontend.career_lhc");
        Route::get(LaravelLocalization::transRoute('routes.career_lhc_show'), 'CareerController@showLHC')->name("frontend.career_lhc.show");
        Route::post('/careers/apply', 'CareerController@apply')->name("frontend.career.apply");

        Route::get(LaravelLocalization::transRoute('routes.career_investors'), 'CareerController@investors')->name("frontend.investors");
        Route::get(LaravelLocalization::transRoute('routes.career_investors_show'), 'CareerController@showInvestors')->name("frontend.investors.show");

        Route::get(LaravelLocalization::transRoute('routes.coming_soon'), function (){
            return view('frontend.coming');
        })->name('page.coming_soon');

        Route::get(trans('routes.service'), 'ServiceController@getServiceDetail')->name('frontend.service.detail');

        Route::get('{slug}', 'PageController@show')->name('page.show')->where('slug', '(.*)?');

    });