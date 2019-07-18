@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/BWID-About-Our-Company.jpg'])
    <section class="mainContact">
        @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
            <div class="container">
                <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
                <div class="listFund" data-waypoint="100%">
                    @foreach($block->children as $item)
                    <div class="listFund__item">
                        <div class="row">
                            <div class="col-md-2 col-sm-3 col-4 break480">
                                <a href="{{ $item->url }}">
                                    <img src="{{$item->icon}}" alt="{{$item->name}}">
                                </a>
                            </div>
                            <div class="col-md-10 col-sm-9 col-8 break480">
                                <h4>{{$item->name}}</h4>
                                {!! $item->content !!}
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        @endif
    </section>
    <section class="mainContact">
        <div class="container">
            <div class="titleHeading" data-waypoint="100%">{{ trans('frontend.property_type') }}</div>
            <div class="logisticList" data-waypoint="100%">
                <div class="row">
                    @foreach($composer_project_category as $item)
                        <div class="col-md-3 col-sm-6 col-12">
                            <div class="logisticList__item">
                                <div class="image effectImg">
                                    <a style="background-image:url('{{$item->thumbnail}}')" href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}">
                                        <img src="{{$item->thumbnail}}" alt="">
                                    </a>
                                </div>
                                <div class="info">
                                    <div class="info__inner">
                                        <a href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}">{{$item->name}}<i class="ic_logistic_arrow"></i></a>
                                    </div>
                                </div>
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