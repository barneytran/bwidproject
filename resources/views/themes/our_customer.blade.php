@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/news/media-center-news.jpg'])
    @if(!empty($blocks['CUSTOMERS']) && $block = $blocks->get('CUSTOMERS')->first())
    <section class="ourLeasing ourLeasing--gray mediaEffect-2" data-waypoint="100%">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            <div class="row">
                @foreach($partners as $item)
                <div class="col-md-4 col-6 break360">
                    <div class="item__logo">
                        <div>
                            <a href="{{$item->link}}" target="_blank" title="{{ $item->name }}">
                                <img src="{{$item->logo}}" alt="{{ $item->name }}">
                            </a>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    @endif
@endsection

@section('script')
@endsection