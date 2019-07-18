@extends('frontend.layouts.master')

@section('style')
    <style>
        .titleIcon{
            margin-top: 3em;
        }
        .titleIcon:before, .titleIcon:after{
            display: none;
        }
    </style>
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/career/bg-career-model.jpg'])
    @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
    <section class="mainLogistic">
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            @if(!empty($blocks['CHART-TITLE-1']) && $block = $blocks->get('CHART-TITLE-1')->first())
            <h3 class="titleIcon"><span>{{$block->name}}</span></h3>
            @endif
            @if(!empty($blocks['CHART-1']) && $block = $blocks->get('CHART-1'))
            <section class="chart" data-waypoint="100%">
                <div class="container">
                    @foreach($block as $index=>$item)
                        <div class="chart__item" data-bg="{{$item->description}}">
                            <div class="chart__item__arrow">{{$item->name}}
                                <div class="chart__item__arrow__after"><span></span><span></span></div>
                            </div>
                            {{--<div class="chart__item__arrow arrow-{{$index}}" data-index="{{$index}}" data-bg="{{$item->description}}">{{$item->name}}</div>--}}
                            <div class="chart__item__content">
                                <ul>
                                    @foreach($item->children as $value)
                                        <li> <i class="fa fa-caret-right"></i>{{$value->name}}</li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    @endforeach
                </div>
            </section>
            @endif

            @if(!empty($blocks['CHART-TITLE-2']) && $block = $blocks->get('CHART-TITLE-2')->first())
                <h3 class="titleIcon"><span>{{$block->name}}</span></h3>
                <section class="chart" data-waypoint="100%">
                    <div class="container">
                        <img src="{{$block->photo_translation ?? $block->photo}}" style="width: 100%" alt="{{$block->name}}">
                    </div>
                </section>
            @endif
        </div>
    </section>
    @endif
@endsection

@section('script')
    <script>
        $('.chart__item').each(function () {
            let bg_color = $(this).data('bg');
            $(this).find('.chart__item__arrow').css('background',bg_color);
            $(this).find('span').css('background',bg_color);
        });
    </script>
@endsection