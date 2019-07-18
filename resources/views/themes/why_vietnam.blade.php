@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
@include('themes.partials.base',['banner'=>'frontend/images/career/bg-career-model.jpg'])
@if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
<section class="mainLogistic">
    <div class="container">
        <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
        <div class="document" data-waypoint="100%">
            {!! $block->description !!}
        </div>
        <section class="logisticList" data-waypoint="100%">
            <div class="row">
                @foreach($services_now as $item)
                <div class="col-lg-4 col-md-3 col-sm-6 col-12">
                    <div class="logisticList__item">
                        <div class="image effectImg"><a style="background-image:url('{{$item->image}}')" href="{{route('frontend.service.detail',['slug'=>$item->slug])}}"><img src="{{$item->image}}" alt=""></a></div>
                        <div class="info">
                            <div class="info__inner"><a href="{{route('frontend.service.detail',['slug'=>$item->slug])}}">
                                    {{$item->title}}<i class="ic_logistic_arrow"></i></a></div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <nav class="text-center">
                {{ $services_now->links() }}
            </nav>
        </section>
    </div>
</section>
@endif
@endsection

@section('script')
@endsection