@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    <section class="mainBeardcrumb" data-waypoint="100%">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 align-self-center">
                    @include('frontend.layouts.partials.breadcrumb')
                </div>
            </div>
        </div>
    </section>
    <section class="mainContact">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('frontend.sitemap')}}</h1>
            <div class="siteMapWrapper" data-waypoint="100%">
                <div class="siteMapWrapper__item">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="titleHeading--news colorMain"><a href="{{getPageUrlByCode('ABOUT')}}">{{getPageUrlByCode('ABOUT','title')}}</a></div>
                            <ul class="siteMap">
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('OUR-COMPANY')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('OUR-COMPANY','title')}}</strong></a></li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('VISION')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('VISION','title')}}</strong></a></li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('TEAM')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('TEAM','title')}}</strong></a></li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('MILESTONES')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('MILESTONES','title')}}</strong></a></li>
                                {{--<li class="siteMap__item"><a href="{{getPageUrlByCode('FUND')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{trans('frontend.fund_management')}}</strong></a></li>--}}
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="titleHeading--news colorMain"><a href="{{getPageUrlByCode('MODEL')}}">{{getPageUrlByCode('MODEL','title')}}</a></div>
                            <ul class="siteMap">
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('MODEL')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('MODEL','title')}}</strong></a></li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('PROPERTY-TYPE')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('PROPERTY-TYPE','title')}}</strong></a>
                                    <ul>
                                        @foreach($composer_project_category as $item)
                                        <li><a href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}" title="{{$item->name}}"><i class="fa fa-caret-right"></i>{{$item->name}}</a></li>
                                        @endforeach
                                    </ul>
                                </li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('VALUE-ADDED')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('VALUE-ADDED', 'title')}}</strong></a></li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('PRESENCE')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{ getPageUrlByCode('PRESENCE','title') }}</strong></a></li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('OUR-CUSTOMER')}}" title="{{$title = getPageUrlByCode('OUR-CUSTOMER', 'title')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{$title}}</strong></a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="titleHeading--news colorMain"><a href="{{ getPageUrlByCode('PROPERTY-FOR-LEASE') }}">{{ getPageUrlByCode('PROPERTY-FOR-LEASE',' title') }}</a></div>
                            <ul class="siteMap">
                                <li class="siteMap__item"><a href="{{ getPageUrlByCode('PROPERTY-FOR-LEASE-SUB') }}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{ getPageUrlByCode('PROPERTY-FOR-LEASE-SUB','title') }}</strong></a></li>
                                @if($investment = \App\Models\Service::first())
                                    <li class="siteMap__item"><a href="{{ route('frontend.service.detail',$investment->slug) }}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{ $investment->title }}</strong></a></li>
                                @endif
{{--                                <li class="siteMap__item"><a href="{{getPageUrlByCode('WHY')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('WHY', 'title')}}</strong></a></li>--}}
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('CASE-STUDIES')}}" title="{{$title = getPageUrlByCode('CASE-STUDIES', 'title')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{$title}}</strong></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="siteMapWrapper__item">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="titleHeading--news colorMain"><a href="{{getPageUrlByCode('MEDIA-CENTER')}}">{{getPageUrlByCode('MEDIA-CENTER', 'title')}}</a></div>
                            <ul class="siteMap">
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('MEDIA-GALLERY')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('MEDIA-GALLERY', 'title')}}</strong></a>
                                    <ul>
                                        <li><a href="{{getPageUrlByCode('MEDIA-GALLERY-PHOTO')}}"><i class="fa fa-caret-right"></i>{{getPageUrlByCode('MEDIA-GALLERY-PHOTO','title')}}</a></li>
                                        <li><a href="{{getPageUrlByCode('MEDIA-GALLERY-VIDEO')}}"><i class="fa fa-caret-right"></i>{{getPageUrlByCode('MEDIA-GALLERY-VIDEO','title')}}</a></li>
                                    </ul>
                                </li>
                                <li class="siteMap__item"><a href="{{getPageUrlByCode('MEDIA-INDEX')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('MEDIA-INDEX')}}</strong></a>
                                    <ul>
                                        @foreach($composer_news_categories_root as $item)
                                        <li>
                                            <a href="{{ route('media.news.category',['parent_slug'=>$item->slug]) }}"><i class="fa fa-caret-right"></i><strong>{{$item->name}}</strong></a>
                                            <ul>
                                                @foreach($item->child as $child)
                                                <li><a href="{{ route('media.news.category',['parent_slug'=>$item->slug, 'slug'=>$child->slug]) }}"><i class="fa fa-angle-right"></i>{{$child->name}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="titleHeading--news colorMain"><a href="{{ getPageUrlByCode('CAREER-INDEX') }}">{{ getPageUrlByCode('CAREER-INDEX','title') }}</a></div>
                            <ul class="siteMap">
                                <li class="siteMap__item"><a href="{{ getPageUrlByCode('CAREER-CULTURE') }}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{getPageUrlByCode('CAREER-CULTURE','title')}}</strong></a></li>
                                <li class="siteMap__item"><a href="{{ getPageUrlByCode('CAREER-OPENING')}}"> <i class="fa fa-arrow-circle-o-right"> </i><strong>{{ getPageUrlByCode('CAREER-OPENING','title')}}</strong></a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="titleHeading--news colorMain"><a href="{{getPageUrlByCode('CONTACT')}}">{{getPageUrlByCode('CONTACT','title')}}</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection