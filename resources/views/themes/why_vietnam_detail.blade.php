@extends('frontend.layouts.master')

@section('style')
    <style>
        .content .document img{
            display: block;
            margin: 0 auto;
            max-width: 100%;
        }
    </style>
@endsection
@section('meta-title')
    <title>{{$service->title}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>$service->banner])
    <section class="mainPropertyDetail" style="margin-bottom: 20px">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{$service->description}}</h1>
            <div class="mainPropertyDetail__wrap document" data-waypoint="100%">
{{--                {!! $service->description !!}--}}
            </div>
        </div>
        <div class="container content">
            <div class="mainPropertyDetail__wrap document" data-waypoint="100%">
                {!! $service->content !!}
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection