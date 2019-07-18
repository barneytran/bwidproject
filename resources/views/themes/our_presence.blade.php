@extends('frontend.layouts.master')

@section('style')
    <style>
        .ourPresenceMap .ourPresenceIP__item span{
            padding-left: 0px;
        }
        .office_name{
            color: #696969;
            font-weight: 700;
            width: 50%;
            overflow: hidden;
            display: block;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            text-overflow: ellipsis;
            transition: all 0.2s ease-in-out;
        }
        .ourPresenceExpand .card-header .mb-0:before {
            display: none;
        }
    </style>
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/BWID-About-Our-Company.jpg'])
    <section class="ourPresence">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{trans('frontend.our_presence')}}</h1>
            <div class="innerourPresence" data-waypoint="100%">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1 col-12">
                        @if($bt = optional($blocks->get('OUR-PRESENCE-DESKTOP'))->first())
                            <div class="ourPresenceMap ourPresenceMap--dt">
                                <img src="{{ $bt->photo_translation }}" style="max-width: 100%;" alt="">
                            </div>
                        @endif
                        @if($bt = optional($blocks->get('OUR-PRESENCE-MOBILE'))->first())
                            <div class="ourPresenceMap ourPresenceMap--mb">
                                <img src="{{ $bt->photo_translation }}" alt="" style="max-width: 100%;">
                            </div>
                        @endif
                    </div>
                </div>
             
            </div>
            <div class="innerourPresence" data-waypoint="100%">
                <div class="ourPresenceExpand">
                    <div id="accordion">
                        @php $city_id_last = 0; @endphp
                        @foreach($branches as $index=>$item)
                            @if($item->city_id == $city_id_last)
                                <li class="expandInfo__item">
                                    <b class="office_name">{{$item->name}}</b>
                                    <span>
                                        @foreach($item->branch_project_categories as $value)
                                            {{--<i class="icon" style="background: url('{{$value->project_category->icon}}') no-repeat center; background-size: 16px"></i>--}}
                                            <a href="{{$value->project ? route('frontend.project_detail',['slug'=>$value->project->slug]) : route('frontend.project_category_detail',['slug'=>$value->project_category->slug]) }}">
                                                            <i class="icon" style="background: url('{{$value->project_category->icon}}') no-repeat center; background-size: 16px"></i>
                                             </a>
                                        @endforeach
                                    </span>
                                </li>
                            @else
                                @if($index)
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                @endif
                                <div class="card">
                                    <div class="card-header" id="heading{{$index}}">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse{{$index}}" aria-expanded="true" aria-controls="collapse{{$index}}">{{$item->city->name}}<span> <i class="ic_arrow_expand"></i></span></button>
                                        </h5>
                                    </div>
                                    <div class="collapse" id="collapse{{$index}}" aria-labelledby="heading{{$index}}" data-parent="#accordion">
                                        <div class="card-body">
                                            <ul class="expandInfo">
                                                <li class="expandInfo__item">
                                                    <b class="office_name">{{$item->name}}</b>
                                                    <span>
                                                    @foreach($item->branch_project_categories as $value)
                                                        <a href="{{$value->project ? route('frontend.project_detail',['slug'=>$value->project->slug]) : route('frontend.project_category_detail',['slug'=>$value->project_category->slug]) }}">
                                                            <i class="icon" style="background: url('{{$value->project_category->icon}}') no-repeat center; background-size: 16px"></i>
                                                        </a>
                                                        @endforeach
                                                </span>
                                                </li>

                            @endif
                            @php $city_id_last = $item->city_id; @endphp
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

@section('script')
@endsection
