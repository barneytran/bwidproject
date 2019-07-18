@extends('frontend.layouts.master')

@section('style')
@endsection
@section('meta-title')
    <title>{{trans('frontend.current_opening')}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/career/bg-career-model.jpg'])
    <section class="ourCareer">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('frontend.current_opening')}}</h1>
            <!--search-->
            <div class="searchJob mediaEffect-2" data-waypoint="100%">
                <form class="form-style" method="get" action="{{ getPageUrlByCode('CAREER-OPENING')}}">
                    <input type="hidden" name="_token" value="c">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <input class="form-control" name="q" value="{{request('q')}}" type="text" placeholder="{{trans('frontend.enter_job_title')}}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <select class="selectpicker show-tick" name="department_id" title="{{trans('frontend.department')}}">
                                    <option value="">--{{trans('frontend.department')}}--</option>
                                    @foreach($categories as $item)
                                        <option value="{{$item->id}}" {{request('department_id') == $item->id ? 'selected' : ''}}>{{$item->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <select class="selectpicker show-tick" name="city_id" title="{{trans('frontend.locations')}}">
                                    <option value="">--{{trans('frontend.locations')}}--</option>
                                    @foreach($cities as $item)
                                    <option value="{{$item->id}}" {{request('city_id') == $item->id ? 'selected' : ''}}>{{$item->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <button class="btn-search btn btn-submit"><i class="fa fa-search"></i>{{trans('frontend.search')}}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--list career-->
            <div class="careerList loadMoreGroup mediaEffect-3" data-waypoint="100%">
                @foreach($career as $item)
                <div class="careerList__item showBox">
                    <div class="row">
                        <div class="col-md-6 col-12">
                            <div class="title"><a href="{{route('career.opening.detail',['slug'=>$item->slug])}}">{{$item->name}}</a></div>
                        </div>
                        <div class="col-md-2 col-4 break360">
                            <div class="branch"><i class="fa fa-briefcase"></i>{{optional($item->category)->name}}</div>
                        </div>
                        <div class="col-md-2 col-4 break360">
                            <div class="add"><i class="fa fa-map-marker"></i>{{optional($item->cities()->first())->name}}</div>
                        </div>
                        <div class="col-md-2 col-4 break360"><a class="btn-view-2" href="{{route('career.opening.detail',['slug'=>$item->slug])}}">{{trans('button.view_detail')}}</a></div>
                    </div>
                </div>
                @endforeach
                <div class="text-center"><a class="loadMore btn-load" href="#" data-load="3" data-show="8">{{trans('frontend.load_more')}}</a></div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection