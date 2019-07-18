@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/business-model/bg-business-model.jpg'])
    <section class="mainContact">
        @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            <div class="document" data-waypoint="100%">
                {!! $block->description !!}
            </div>
            <div class="businessFeatures" data-waypoint="100%">
                <div class="row">
                    @foreach($block->children as $item)
                    <div class="col-md-4 col-12">
                        <div class="businessFeatures__item">
                            <h4 class="businessFeatures__item__title"> <i class="businessFeatures__item__icon" style="background: url('{{$item->icon}}') no-repeat center;"></i>{{$item->name}}</h4>
                            <p class="businessFeatures__item__text">{!! $item->content !!}</p>
                        </div>
                    </div>
                    @endforeach
                </div>
                @if(!empty($blocks['DEV']) && $block1 = $blocks->get('DEV')->first())
                <div class="row">
                    <div class="col-12">
                        <h4 class="heading--3">{{$block1->name}}</h4>
                        <div class="image"><img src="{{$block1->photo_translation}}"></div>
                    </div>
                </div>
                @endif
            </div>
        </div>
        @endif
    </section>
@endsection

@section('script')
@endsection