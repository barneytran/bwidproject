@extends('frontend.layouts.master')

@section('style')
@endsection
@section('meta-title')
    <title>{{$news_category->name}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>$news_category->banner ?? 'frontend/images/news/media-center-news.jpg'])
    <section class="ourNewsList">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{ trans('news.news') }}</h1>
            <div class="gridNews--2 mediaEffect" data-waypoint="100%">
                <ul class="navLink">
                    @foreach($news_category_parent->child as $index=>$child)
                    <li class="{{$news_category->id == $child->id ? 'active' : ''}}"><a href="{{route('media.news.category',['parent_slug'=>$news_category_parent->slug, 'slug'=>$child->slug])}}">{{ $child->name }}</a></li>
                    @endforeach
                </ul>
                <div class="row">
                    @foreach($news as $item)
                    <div class="col-md-4 col-6 break360">
                        <div class="itemNew">
                            <div class="image effectImg"><a style="background-image:url('{{getLocalFile($item->image)}}')" href="{{route('media.news.detail',['slug'=>$item->slug])}}"><img src="{{getLocalFile($item->image)}}"></a></div>
                            <div class="info">
                                <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($item->publish_at, 'd-m-Y')}}</div><a class="title" href="{{route('media.news.detail',['slug'=>$item->slug])}}">{{summary($item->title, 140)}}</a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <nav class="text-center">
                {{$news->links()}}
            </nav>
        </div>
    </section>
@endsection

@section('script')
@endsection