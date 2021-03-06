@extends('frontend.layouts.master')

@section('style')
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/BWID-About-Our-Company.jpg'])

    <section class="mainContact">
        @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
        <div class="container">
            <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
            @if(!empty($blocks['TIMELINE']) && $timeline = $blocks->get('TIMELINE'))
            <div class="timeline" data-waypoint="100%">
                @foreach($timeline as $item)
                    <div class="timeline__item">
                        <div class="timeline__year"style="font-size:1.2rem"><span>{{$item->name}}</span></div>
                        @foreach($item->children as $value)
                            <div class="timeline__item__content"><i class="ic-dot"></i>
                                <div class="timeline__item__content__des d-flex">
                                    <div class="info">{!! $value->content !!}</div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endforeach
            </div>
            @endif
        </div>
        @endif
    </section>
@endsection

@section('script')
@endsection
