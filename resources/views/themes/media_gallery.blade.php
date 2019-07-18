@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/news/banner-galary.jpeg'])
    <section class="ourNews mediaEffect" data-waypoint="100%">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('frontend.gallery')}}</h1>
            <div class="gridNews">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="titleHeading--news">{{trans('frontend.photo')}}</div>
                    </div>
                    <div class="col-sm-3 titleHeading--link"><a class="btn-view" href="{{getPageUrlByCode('MEDIA-GALLERY-PHOTO')}}"><i class="fa fa-bars"></i>{{trans('frontend.view_all')}}</a></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="newsPhoto">
                            @php $count = $media_gallery_photo->count(); $count = $count > 3 ? $count - 3 : $count; @endphp
                            @for($i=0; $i < $count; $i++)
                                @php $item = $media_gallery_photo->shift(); @endphp
                                <div class="gridNews__big itemNew">
                                    <div class="image effectImg">
                                        <a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}">
                                            <img src="{{$item->thumbnail}}" alt="">
                                        </a>
                                    </div>
                                    <div class="info">
                                        <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($item->published_date, 'd-m-Y')}}</div>
                                        <a class="title" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}">{{summary($item->name, 110)}}</a>
                                        <a class="btn-link btn-gray" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}">
                                            {{trans('button.view_more')}}<i class="ic-link"></i>
                                        </a>
                                    </div>
                                </div>
                            @endfor
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="newsList newsList--other">
                            @foreach($media_gallery_photo as $item)
                            <div class="newsList__item itemNew">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="image effectImg">
                                            <a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}">
                                                <img src="{{$item->thumbnail}}"><i class="ic-img"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info">
                                            <div class="date">
                                                <i class="fa fa-calendar"></i>
                                                {{Date2String($item->published_date, 'd-m-Y')}}
                                            </div>
                                            <a class="title" href="{{route('media.gallery.photo.detail',['slug'=>$item->slug])}}">{{summary($item->name, 110)}}</a>
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
                    <div class="titleHeading--news">{{trans('frontend.video')}}</div>
                </div>
                <div class="col-sm-3 titleHeading--link"><a class="btn-view" href="{{getPageUrlByCode('MEDIA-GALLERY-VIDEO')}}"><i class="fa fa-bars"></i>{{trans('frontend.view_all')}}</a></div>
            </div>
            <div class="newsVideo">
                <div class="row">
                    <div class="col-md-6">
                        @if($item = $media_gallery_video->shift())
                        <div class="gridNews__big itemNew">
                            <div class="image effectImg">
                                <a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}">
                                    <img src="{{$item->thumbnail}}" alt=""><i class="ic-img"></i>
                                </a>
                            </div>
                            <div class="info">
                                <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($item->published_date, 'd-m-Y')}}</div>
                                <a class="title" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}">{{summary($item->name, 110)}}</a>
                                <a class="btn-link btn-gray" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}">
                                    {{trans('button.view_more')}}<i class="ic-link"></i>
                                </a>
                            </div>
                        </div>
                        @endif
                    </div>
                    <div class="col-md-6">
                        <div class="newsList newsList--other">
                            @foreach($media_gallery_video as $item)
                            <div class="newsList__item itemNew">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="image effectImg"><a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}"><img src="{{$item->thumbnail}}"><i class="ic-img"></i></a></div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info">
                                            <div class="date"> <i class="fa fa-calendar"></i>
                                                {{Date2String($item->published_date, 'd-m-Y')}}
                                            </div>
                                            <a class="title" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}">{{summary($item->name, 110)}}</a>
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
@endsection

@section('script')
@endsection