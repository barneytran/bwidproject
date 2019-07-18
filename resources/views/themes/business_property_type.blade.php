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
                {!! $block->content !!}
            </div>

            <section class="propertyTypeList" data-waypoint="100%">
                @foreach($composer_project_category as $item)
                <div class="row propertyTypeList__inner">
                    <div class="col-lg-6 col-md-5 col-12">
                        <div class="propertyTypeList__images effectImg"><a style="background-image:url('{{$item->thumbnail}}')" href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}"><img src="{{$item->thumbnail}}" alt=""></a></div>
                    </div>
                    <div class="col-lg-6 col-md-7 col-12 d-flex align-items-center">
                        <div class="propertyTypeList__item">
                            <h4 class="propertyTypeList__item__title"><a href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}">{{$item->name}}</a></h4>
                            <p class="propertyTypeList__item__text">{{summary($item->description,280)}}</p><a class="btn-link btn-gray" href="{{route('frontend.project_category_detail',['slug'=>$item->slug])}}">
                                {{trans('frontend.learn_more')}}<i class="ic-link"></i></a>
                        </div>
                    </div>
                </div>
                @endforeach
            </section>
        </div>
        @endif
    </section>
@endsection

@section('script')
@endsection