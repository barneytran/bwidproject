@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/BWID-About-Our-Company.jpg'])
    <section class="mainContact">
        <div class="container">
            @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            <div class="document" data-waypoint="100%">
                {!! $block->content !!}
            </div>
            @endif
        </div>
    </section>
@endsection

@section('script')
@endsection