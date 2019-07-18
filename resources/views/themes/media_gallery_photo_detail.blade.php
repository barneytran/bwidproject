@extends('frontend.layouts.master')

@section('style')
@endsection
@section('meta-title')
    <title>{{$media_photo_detail->name}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/news/media-center.jpg'])
    <section class="ourNewsDetail">
        <div class="container">
            <h1 class="titleHeading titleHeading--content" data-waypoint="100%">{{$media_photo_detail->name}}</h1>
            <div class="mediaEffect" data-waypoint="100%">
                <div class="row">
                    <div class="col-md-5">
                        <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($media_photo_detail->published_date, 'd-m-Y')}}</div>
                    </div>
                    <div class="col-md-7">
                        @include('themes.partials.share',['title'=>$media_photo_detail->name])
                    </div>
                </div>
                <div class="slideDetail">
                    <div class="bigImg">
                        @foreach($media_photo_detail->medias as $item)
                        <div class="bigImg__item">
                            <div class="image effectImg" style="background-image:url('{{$item->path}}')"><img src="{{$item->path}}" alt=""></div>
                        </div>
                        @endforeach
                    </div>
                    <div class="navImg">
                        @foreach($media_photo_detail->medias as $item)
                        <div class="navImg__item">
                            <div class="image effectImg" style="background-image:url('{{$item->path}}')"><img src="{{$item->path}}" alt=""></div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="relativeBox mediaEffect-2" data-waypoint="100%">
                <div class="titleHeading--news">{{trans('frontend.related_photos')}}</div>
                <div class="gridNews--2 gridNewsPhoto slideNews">
                    @foreach($media_photo_relative as $item)
                    <div class="itemNew">
                        <div class="image effectImg"><a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}"><img src="{{$item->thumbnail}}"><i class="ic-img"></i></a></div>
                        <div class="info"><a class="title" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}">{{summary($item->name, 140)}}</a></div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection