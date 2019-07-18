@extends('frontend.layouts.master')

@section('style')
    <style>
        #btn-clear{
            display: {{request('category_id') || request('city_id') ? 'block !important' : 'none'}};
        }
    </style>
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/business-model/bg-business-model.jpg'])
    <section class="ourLeasing">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('frontend.property_for_lease')}}</h1>
            <div class="mediaEffect" data-waypoint="100%">
                <div class="searchLease">
                    <form class="form-style" id="form-filter" method="get" action="{{url()->current()}}">
                        {{ csrf_field() }}
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select class="selectpicker show-tick" name="category_id" title="{{trans('frontend.select_property_type')}}">
                                        <option value="">{{trans('frontend.all')}}</option>
                                        @foreach($composer_project_category as $item)
                                        <option value="{{$item->id}}" {{request('category_id') == $item->id ? 'selected' : ''}}>{{$item->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select class="selectpicker show-tick" name="city_id" title="{{trans('frontend.select_region')}}">
                                        @foreach($cities as $item)
                                            <option value="{{$item->id}}" {{request('city_id') == $item->id ? 'selected' : ''}}>{{$item->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <button class="btn-clear btn btn-submit" type="button" id="btn-clear" ><i class="fa fa-times"></i>{{trans('frontend.clear')}}</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--list-->
            <div class="listLease mediaEffect-2" data-waypoint="100%">
                <div class="row">
                    @foreach($projects as $item)
                        @if($item->active == 1)
                      <div class="col-md-4 col-6 break360">
                        <div class="listLease__item">
                            <div class="listLease__item__image">
                                <div class="image effectImg">
                                    <a style="background-image:url('{{$item->thumbnail}}')" href="{{route('frontend.project_detail',['slug'=>$item->slug])}}">
                                        <img src="{{$item->thumbnail}}">
                                    </a>
                                </div>
                                <h4>{{$item->category->name}}</h4>
                            </div>
                            <div class="info">
                                <a class="title" href="{{route('frontend.project_detail',['slug'=>$item->slug])}}">{{$item->name}}</a>
{{--                                <p>{{summary($item->description, 75 )}}</p>--}}
                                <div class="name">
                                    <h5>{{$item->contact_person}}</h5>
                                    <p>{{trans('contact.tel')}} : {{$item->phone}}</p>
                                </div><a class="btn-link btn-gray" href="{{route('frontend.project_detail',['slug'=>$item->slug])}}">
                                    {{trans('frontend.learn_more')}} <i class="ic-link"></i></a>
                            </div>
                        </div>
                    </div>
                        @endif
                    @endforeach
                </div>
            </div>
            <div class="mediaEffect-3" data-waypoint="100%">
                <nav class="text-center">
                    {{$projects->appends(request()->all())->links()}}
                </nav>
            </div>
        </div>
    </section>
@endsection

@section('script')
    <script>
        $('.selectpicker').change(function () {
            $('#form-filter').submit();
        });
    </script>
@endsection