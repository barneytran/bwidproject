@extends('frontend.layouts.master')

@section('style')
@endsection
@section('meta-title')
    <title>{{$news->title}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>$news->banner ?? 'frontend/images/news/media-center-detail.jpg'])
    <section class="ourNewsDetail">
        <div class="container">
            <h1 class="titleHeading titleHeading--content" data-waypoint="100%">{{$news->title}}</h1>
            <div class="mediaEffect" data-waypoint="100%">
                <div class="row">
                    <div class="col-md-5">
                        <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($news->publish_at,'d-m-Y')}}</div>
                    </div>
                    <div class="col-md-7">
                        @include('themes.partials.share',['title'=>$news->title])
                    </div>
                </div>
                <div class="document">
                   {!! $news->content !!}
                </div>
            </div>
            <div class="relativeBox mediaEffect-2" data-waypoint="100%">
                <div class="titleHeading--news">{{trans('news.related_news')}}</div>
                <div class="gridNews--2 slideNews">
                    @foreach($news_relative as $item)
                    <div class="itemNew">
                        <div class="image effectImg"><a style="background-image:url('{{getLocalFile($item->image)}}')" href="{{route('media.news.detail',['slug'=>$item->slug])}}"><img src="{{getLocalFile($item->image)}}"></a></div>
                        <div class="info">
                            <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($item->publish_at, 'd-m-Y')}}</div><a class="title" href="{{route('media.news.detail',['slug'=>$item->slug])}}">{{summary($item->title, 140)}}</a>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection