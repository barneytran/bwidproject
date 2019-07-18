@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/career/bg-career-model.jpg'])
    <section class="ourCareer">
        <div class="container">
            @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            <div class="document mediaEffect" data-waypoint="100%">
                {!! $block->content !!}
            </div>
            @endif
            <div class="slideDetail slideDetail--content mediaEffect-2" data-waypoint="100%">
                <div class="bigImgContent">
                    @foreach($sliders as $item)
                    <div class="bigImgContent__item">
                        <div class="image effectImg" style="background-image:url('{{$item->image}}')"><img src="{{$item->image}}" alt=""></div>
                    </div>
                    @endforeach
                </div>
                <div class="navImgContent">
                    @foreach($sliders as $item)
                    <div class="navImgContent__item">
                        <p>{{$item->name}}</p>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection