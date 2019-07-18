@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/news/media-center.jpg'])
    <section class="ourNewsList">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('frontend.video')}}</h1>
            <div class="gridNews--2 gridNewsPhoto gridNewsVideo mediaEffect" data-waypoint="100%">
                <div class="row">
                    @foreach($media_gallery_video as $item)
                        <div class="col-md-4 col-6 break360">
                            <div class="itemNew">
                                <div class="image effectImg"><a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}"><img src="{{$item->thumbnail}}"><i class="ic-img"></i></a></div>
                                <div class="info"><a class="title" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}">{{summary($item->name, 140)}}</a></div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <nav class="text-center">
                {{$media_gallery_video->links()}}
            </nav>
        </div>
    </section>
@endsection

@section('script')
@endsection