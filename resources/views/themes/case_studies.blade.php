@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/lease/case-studies.jpg'])
    <section class="ourLeasing">
        <div class="container">
            @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            <div class="document mediaEffect" data-waypoint="100%">
                <p>{{$block->description}}</p>
            </div>
            @endif
            @if(!empty($blocks['TAB']) && $tabs = $blocks->get('TAB'))
                <ul class="navLink nav nav-tabs mediaEffect-2" data-waypoint="100%" id="nav-tab" role="tablist">
                    @foreach($tabs as $index=>$tab)
                    <li><a class="{{!$index ? 'active' : ''}}" data-toggle="tab" id="tab{{$index}}-tab" href="#tab{{$index}}" role="tab" aria-controls="tab{{$index}}" aria-selected="{{!$index ? 'true' : 'false'}}">{{$tab->name}}</a></li>
                    @endforeach
                </ul>
                <div class="tab-content mediaEffect-3" data-waypoint="100%">
                    @foreach($tabs as $index=>$tab)
                    <div class="tab-pane fade {{!$index ? 'show active' : ''}}" id="tab{{$index}}" role="tabpanel" aria-labelledby="tab{{$index}}-tab">
                        <div class="accordion" id="accordionExample">
                            @foreach($tab->children as $key=>$child)
                                <div class="card">
                                    <div class="card-header" id="heading{{"$index-$key"}}">
                                        <h5 class="mb-0"><a data-toggle="collapse" href="#" data-target="#collapse{{"$index-$key"}}" aria-expanded="true" aria-controls="collapse{{"$index-$key"}}"> <span class="icon-tab"><i class="fa fa-angle-double-up"></i></span>{{$child->name}}</a></h5>
                                    </div>
                                    <div class="collapse show" id="collapse{{"$index-$key"}}" aria-labelledby="heading{{"$index-$key"}}" data-parent="#accordionExample">
                                        <div class="card-body">
                                            @if($child->code == 'IMAGE')
                                                <div class="document">
                                                    <div class="row">
                                                        @foreach($child->medias as $media)
                                                            <div class="col-sm-6">
                                                                <p><img src="{{$media->path}}" alt=""></p>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            @endif
                                            @if($child->code == 'SLIDER')
                                                <div class="sliderCase">
                                                    @foreach($child->medias as $media)
                                                        <div class="sliderCase__item">
                                                            <div class="image effectImg" style="background-image:url('{{$media->path}}')"><img src="{{$media->path}}" alt=""></div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            @endif
                                            <div class="document">
                                                <p>{{$child->description}}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    @endforeach
                </div>
             @endif
        </div>
    </section>
@endsection

@section('script')
@endsection