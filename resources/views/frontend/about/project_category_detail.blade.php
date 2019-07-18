@extends('frontend.layouts.master')

@section('style')
@endsection

@section('meta-title')
    <title>{{$project_category->name}}</title>
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>$project_category->banner])
    <section class="mainLogistic">
        <div class="container">
            <h1 class="titleHeading" >{{$project_category->name}}</h1>
            <div class="document" data-waypoint="100%">
                {!! $project_category->description !!}
            </div>
            <section class="logisticList" data-waypoint="100%">
                <div class="row">
                    @foreach($projects as $item)
                    <div class="col-lg-4 col-md-3 col-sm-6 col-12">
                        <div class="logisticList__item">
                            <div class="image effectImg"><a style="background-image:url('{{$item->thumbnail}}')" href="{{route('frontend.project_detail',['slug'=>$item->slug])}}"><img src="{{$item->thumbnail}}" alt=""></a></div>
                            <div class="info">
                                <div class="info__inner"><a href="{{route('frontend.project_detail',['slug'=>$item->slug])}}">
                                        {{$item->name}}<i class="ic_logistic_arrow"></i></a></div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
                <nav class="text-center">
                    {{ $projects->links() }}
                </nav>
            </section>
        </div>
    </section>
@endsection

@section('script')
@endsection