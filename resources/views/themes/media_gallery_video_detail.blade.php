@extends('frontend.layouts.master')

@section('style')
@endsection
@section('meta-title')
    <title>{{$media_video_detail->name}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/news/media-center.jpg'])
    <section class="ourNewsDetail">
        <div class="container">
            <h1 class="titleHeading titleHeading--content" data-waypoint="100%">{{$media_video_detail->name}}</h1>
            <div class="mediaEffect" data-waypoint="100%">
                <div class="row">
                    <div class="col-md-5">
                        <div class="date"> <i class="fa fa-calendar"></i>{{Date2String($media_video_detail->published_date, 'd-m-Y')}}</div>
                    </div>
                    <div class="col-md-7">
                        @include('themes.partials.share',['title'=>$media_video_detail->name])
                    </div>
                </div>
                <div class="slideDetail slideDetailVideo">
                    <div class="slideDetailVideo__inner">
                        <div class="image imageEffect" style="background-image:url('{{$media_video_detail->thumbnail}}')"><img src="{{$media_video_detail->thumbnail}}" alt=""></div><a class="playVideo" href="javascript:void(0)" id="play01"><i></i></a>
                        <iframe class="videoInner" id="video01" width="100%" height="100%" src="https://www.youtube.com/embed/{{get_youtube_id($media_video_detail->url_video)}}?enablejsapi=1&amp;showinfo=0&amp;rel=0" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen=""></iframe>
                    </div>
                </div>
                <script>
                    var player01;
                    function onYouTubePlayerAPIReady() {
                        player01 = new YT.Player('video01', {
                            events: {
                                'onReady': onPlayerReady
                                //'onStateChange': onPlayerStateChange
                            }
                        });
                    }
                    function onPlayerReady(event) {

                        var playButton01 = document.getElementById("play01");
                        playButton01.addEventListener("click", function() {
                            player01.playVideo();
                            this.parentElement.className += " showvideo";
                        });

                    }
                    // Inject YouTube API script
                    var tag = document.createElement('script');
                    tag.src = "//www.youtube.com/player_api";
                    var firstScriptTag = document.getElementsByTagName('script')[0];
                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                </script>
            </div>
            <div class="relativeBox mediaEffect-2" data-waypoint="100%">
                <div class="titleHeading--news">{{trans('frontend.related_videos')}}</div>
                <div class="gridNews--2 gridNewsPhoto gridNewsVideo slideNews">
                    @foreach($media_video_relative as $item)
                    <div class="itemNew">
                        <div class="image effectImg"><a style="background-image:url('{{$item->thumbnail}}')" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}"><img src="{{$item->thumbnail}}"><i class="ic-img"></i></a></div>
                        <div class="info"><a class="title" href="{{route('media.gallery.video.detail',['slug'=>$item->slug])}}">{{summary($item->name, 140)}}</a></div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection