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
            <div class="listTeam" data-waypoint="100%">
                <div class="row">
                    @foreach($teams as $key=>$team)
                    <div class="col-md-6">
                        <div class="listTeam__item">
                            <div>
                                <div class="image effectImg"><a data-toggle="modal" data-slide="{{($key+1)}}" data-target="#teamModal" href="#" style="background-image:url('{{$team->avatar}}')"><img src="{{$team->avatar}}" alt=""></a></div>
                            </div>
                            <div class="info">
                                <h4><a data-toggle="modal" data-slide="{{($key+1)}}" data-target="#teamModal" href="#" >{{$team->name}}</a></h4>
                                <h5>{{$team->position}}</h5>
                                <p>{{ summary($team->description, 115) }}</p>
                                <a class="btn-link btn-gray" data-toggle="modal" data-slide="{{($key+1)}}" data-target="#teamModal" href="#">{{trans('frontend.learn_more')}}<i class="ic-link"></i></a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="modal teamModal fade" id="teamModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><i class="ic-close"></i></button>
                        <div class="modal-body">
                            <div class="teamSlide">
                                @foreach($teams as $team)
                                <div class="teamSlide__item">
                                    <div class="image" style="background-image:url('{{$team->avatar}}')"><img src="{{$team->avatar}}" alt=""></div>
                                    <div class="info">
                                        <h4>{{$team->name}}</h4>
                                        <h5>{{$team->position}}</h5>
                                        {!! $team->description !!}
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection