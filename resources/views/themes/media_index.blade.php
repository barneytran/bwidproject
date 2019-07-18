@extends('frontend.layouts.master')

@section('style')
    <style>
        .slick-track{
            margin: inherit;
        }
    </style>
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/BWID-About-Our-Company.jpg'])
    <section class="ourNews">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('news.news')}}</h1>
            <div class="gridNews mediaEffect" data-waypoint="100%">
                <div class="titleHeading--news">{{trans('news.lasted_news')}}</div>
                <div class="row">
                    @if($item = $latest_news->shift())
                        <div class="col-md-6">
                            <div class="gridNews__big itemNew">
                                <div class="image effectImg"><a style="background-image:url('{{ getLocalFile($item->image) }}')"
                                                                href="{{route('media.news.detail',['slug'=>$item->slug])}}"><img
                                                src="{{getLocalFile($item->image)}}" alt=""></a></div>
                                <div class="info">
                                    <div class="date"><i
                                                class="fa fa-calendar"></i>{{Date2String($item->publish_at, 'd-m-Y')}}
                                    </div>
                                    <a class="title"
                                       href="{{route('media.news.detail',['slug'=>$item->slug])}}">{{summary($item->title, 116)}}</a>
                                    <a class="btn-link btn-gray" href="{{getPageUrlByCode('MEDIA-NEWS-LIST-BW')}}">{{trans('product.view_more')}}<i class="ic-link"></i></a>
                                </div>
                            </div>
                        </div>
                    @endif
                    <div class="col-md-6">
                        <div class="newsList">
                            @foreach($latest_news as $item)
                                <div class="newsList__item itemNew">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="image effectImg"><a
                                                        style="background-image:url('{{getLocalFile($item->image)}}')" href="{{route('media.news.detail',['slug'=>$item->slug])}}"><img
                                                            src="{{getLocalFile($item->image)}}"></a></div>
                                        </div>
                                        <div class="col-6">
                                            <div class="info">
                                                <div class="date"><i
                                                            class="fa fa-calendar"></i>{{Date2String($item->publish_at, 'd-m-Y')}}
                                                </div>
                                                <a class="title" href="{{route('media.news.detail',['slug'=>$item->slug])}}">{{summary($item->title, 116)}}</a>
                                                <!--= title-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ourNews--2 mediaEffect-2" data-waypoint="100%">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="titleHeading--news">{{trans('frontend.news_investor')}}</div>
                </div>
                <div class="col-sm-3 titleHeading--link"><a class="btn-view" href="{{ route('media.news.category',['parent_slug' => getNewsCategoryByCode('INVESTORS')->slug ]) }}"><i
                                class="fa fa-bars"></i>{{trans('frontend.view_all')}}</a></div>
            </div>
            <div class="gridNews--2 slideNews">
                @foreach($investor_news as $item)
                    <div class="itemNew">
                        <div class="image effectImg">
                            <a style="background-image:url('{{getLocalFile($item->image)}}')" href="{{route('media.news.detail',['slug'=>$item->slug])}}">
                                <img src="{{$item->image}}">
                            </a>
                        </div>
                        <div class="info">
                            <div class="date"><i class="fa fa-calendar"></i>{{Date2String($item->publish_at, 'd-m-Y')}}</div>
                            <a class="title" href="{{route('media.news.detail',['slug'=>$item->slug])}}">{{summary($item->title, 116)}}</a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <section class="ourNews--3 mediaEffect-3" data-waypoint="100%">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="titleHeading--news">{{trans('frontend.news_bw')}}</div>
                </div>
                <div class="col-sm-3 titleHeading--link"><a class="btn-view" href="{{ route('media.news.category',['parent_slug'=>getNewsCategoryByCode('BW')->slug ]) }}"><i
                                class="fa fa-bars"></i>{{trans('frontend.view_all')}}</a></div>
            </div>
            <div class="gridNews--2 slideNews">
                @foreach($bw_news as $item)
                    <div class="itemNew">
                        <div class="image effectImg">
                            <a style="background-image:url('{{getLocalFile($item->image)}}')" href="{{route('media.news.detail',['slug'=>$item->slug])}}">
                                <img src="{{getLocalFile($item->image)}}">
                            </a>
                        </div>
                        <div class="info">
                            <div class="date"><i class="fa fa-calendar"></i>{{Date2String($item->publish_at, 'd-m-Y')}}</div>
                            <a class="title" href="{{route('media.news.detail',['slug'=>$item->slug])}}">{{summary($item->title, 116)}}</a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection