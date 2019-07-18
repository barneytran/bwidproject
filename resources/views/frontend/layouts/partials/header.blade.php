<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-9"><a class="logo" href="{{route('page.home')}}"><img src="/assets/images/logo.svg" alt=""></a></div>
            <div class="col-lg-9 col-3"><a class="header__toggle" href="#"><span></span><span></span><span></span><span></span></a>
                <div class="wrapMenu">
                    <div class="menuMain">
                        <ul class="nav-menu" id="main-menu">
                            <li class="nav-item hasChild"><a class="nav-link" href="{{getPageUrlByCode('ABOUT')}}" title="{{ $title = getPageUrlByCode('ABOUT', 'title') }}"><span>{{ $title }}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                <ul id="">
                                    <li class=""><a href="{{getPageUrlByCode('OUR-COMPANY')}}" title="{{ $title = getPageUrlByCode('OUR-COMPANY', 'title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li><a href="{{getPageUrlByCode('VISION')}}" title="{{ $title = getPageUrlByCode('VISION', 'title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li><a href="{{getPageUrlByCode('TEAM')}}" title="{{ $title = getPageUrlByCode('TEAM', 'title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li><a href="{{getPageUrlByCode('MILESTONES')}}" title="{{ $title = getPageUrlByCode('MILESTONES', 'title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                    {{--<li><a href="{{getPageUrlByCode('FUND')}}" title="{{trans('frontend.fund_management')}}"><span>{{trans('frontend.fund_management')}}</span></a>--}}
                                    {{--</li>--}}
                                </ul>
                            </li>
                            <li class="nav-item hasChild"><a class="nav-link" href="{{getPageUrlByCode('OUR-BUSINESS')}}" title="{{ $title = getPageUrlByCode('OUR-BUSINESS', 'title') }}"><span>{{ $title }}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                <ul id="">
                                    <li><a href="{{getPageUrlByCode('MODEL')}}" title="{{ $title = getPageUrlByCode('MODEL', 'title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li class=" hasChild"><a href="{{getPageUrlByCode('PROPERTY-TYPE')}}" title="{{ $title = getPageUrlByCode('PROPERTY-TYPE', 'title') }}"><span>{{ $title }}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                        <ul id="">
                                            @foreach($composer_project_category as $item)
                                            <li><a href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}" title="{{$item->name}}"><span>{{$item->name}}</span></a>
                                            </li>
                                            @endforeach
                                        </ul>
                                    </li>
                                    <li><a href="{{getPageUrlByCode('VALUE-ADDED')}}" title="{{$title = getPageUrlByCode('VALUE-ADDED', 'title')}}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li><a href="{{getPageUrlByCode('PRESENCE')}}" title="{{ $title = getPageUrlByCode('PRESENCE', 'title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li><a href="{{getPageUrlByCode('OUR-CUSTOMER')}}" title="{{$title = getPageUrlByCode('OUR-CUSTOMER', 'title')}}"><span>{{$title}}</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item hasChild"><a class="nav-link" href="{{ getPageUrlByCode('PROPERTY-FOR-LEASE')}}" title="{{ $title = getPageUrlByCode('PROPERTY-FOR-LEASE', 'title') }}"><span>{{ $title }}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                <ul class="menuChild" id="navbar-654">
                                    <li><a href="{{ getPageUrlByCode('PROPERTY-FOR-LEASE-SUB') }}" title="{{ $title = getPageUrlByCode('PROPERTY-FOR-LEASE-SUB', 'title')}}"><span>{{$title}}</span></a>
                                    </li>
                                    {{--<li><a href="{{getPageUrlByCode('WHY')}}" title="{{$title = getPageUrlByCode('WHY', 'title')}}"><span>{{$title}}</span></a>--}}
                                    {{--</li>--}}
                                    <li><a href="{{getPageUrlByCode('CASE-STUDIES')}}" title="{{$title = getPageUrlByCode('CASE-STUDIES', 'title')}}"><span>{{$title}}</span></a>
                                    </li>
                                </ul>
                            </li>
                            @if($investment = \App\Models\Service::first())
                                <li class="nav-item"><a class="nav-link" href="{{ route('frontend.service.detail',$investment->slug) }}" title="{{ $investment->title }}"><span>{{ $investment->title }}</span></a>
                                </li>
                            @endif
                            <li class="nav-item hasChild"><a class="nav-link" href="{{getPageUrlByCode('MEDIA-CENTER')}}" title="{{$title = getPageUrlByCode('MEDIA-CENTER', 'title')}}"><span>{{$title}}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                <ul class="menuChild" id="navbar-70">
                                    <li class=" hasChild"><a href="{{getPageUrlByCode('MEDIA-GALLERY')}}" title="{{$title = getPageUrlByCode('MEDIA-GALLERY', 'title')}}"><span>{{$title}}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                        <ul id="navbar-732">
                                            <li><a href="{{getPageUrlByCode('MEDIA-GALLERY-PHOTO')}}" title="{{$title = getPageUrlByCode('MEDIA-GALLERY-PHOTO','title')}}"><span>{{$title}}</span></a>
                                            </li>
                                            <li><a href="{{getPageUrlByCode('MEDIA-GALLERY-VIDEO')}}" title="{{$title = getPageUrlByCode('MEDIA-GALLERY-VIDEO','title')}}"><span>{{$title}}</span></a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class=" hasChild"><a href="{{getPageUrlByCode('MEDIA-INDEX')}}" title="{{$title = getPageUrlByCode('MEDIA-INDEX','title')}}"><span>{{ $title }}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                        <ul id="navbar-1186">
                                            @foreach($composer_news_categories_root as $item)
                                            <li><a href="{{ route('media.news.category',['parent_slug'=>$item->slug]) }}" title="{{ $item->name }}"><span>{{ $item->name }}</span></a>
                                            </li>
                                            @endforeach
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item hasChild"><a class="nav-link" href="{{ getPageUrlByCode('CAREER-INDEX')}}" title="{{$title = getPageUrlByCode('CAREER-INDEX','title')}}"><span>{{ $title }}</span></a><span class="expand"><i class="fa fa-angle-down"></i></span>
                                <ul class="menuChild" id="navbar-1272">
                                    <li class=""><a href="{{ getPageUrlByCode('CAREER-CULTURE') }}" title="{{$title = getPageUrlByCode('CAREER-CULTURE','title')}}"><span>{{ $title }}</span></a>
                                    </li>
                                    <li><a href="{{ getPageUrlByCode('CAREER-OPENING')}}" title="{{ $title = getPageUrlByCode('CAREER-OPENING','title') }}"><span>{{ $title }}</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="{{getPageUrlByCode('CONTACT')}}" title="{{ $title = getPageUrlByCode('CONTACT', 'title') }}"><span>{{ $title }}</span></a>
                            </li>
                        </ul>
                        <div class="searchMobile">
                            <form action="{{route('page.search')}}" method="get">
                                <div class="searchMobileInner">
                                    <input class="form-control" type="text" name="q" value="{{request()->get('q')}}"  placeholder="{{trans('frontend.search')}}...">
                                    <button class="btn-search-close"></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="languageBox">
                    <div class="dropdown">
                        <button style="text-transform: uppercase" class="btn dropdown-toggle btn-language" id="dropdownMenuButton" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/flags/{{ $composer_locale }}.png" alt=""></button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                            @foreach($composer_locales as $localeCode => $properties)
                                <a class="dropdown-item" title="{{$properties['native']}}" href="{{ \App\Helper\TranslateUrl::getLink($localeCode)  }}"><img src="images/flags/{{ $localeCode }}.png" alt=""></a>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="phoneBox">
                    <div class="dropdown">
                        <button class="btn dropdown-toggle btn-phone" id="dropdownMenuButtonPhone" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-phone"></i></button>
                        <div class="dropdown-menu" style="width: 200px;" aria-labelledby="dropdownMenuButtonPhone">
                            <a class="link-hotline" href="tel:{{System::content('phone_bottom')}}">
                                Hotline: {{System::content('phone_bottom')}}</a>
{{--                            <a class="link-hotline" href="tel:{{System::content('phone_bottom_no')}}">{{ trans('frontend.north') }}: {{System::content('phone_bottom_no')}}</a>--}}
                        </div>
                    </div>
                </div>
                <div class="searchBox">
                    <button class="btn-search navbar-search-btn"><i class="fa fa-search"></i></button>
                </div>
                <form action="{{route('page.search')}}" method="get">
                    <div class="innerSearch navbar-search">
                        <input class="form-control" type="text" name="q" value="{{request()->get('q')}}" placeholder="{{trans('frontend.looking_for')}}?">
                        <button class="btn-search-close"><i class="fa fa-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<style>
    .dropdown-menu.show{
        top: 3px !important;
    }
</style>