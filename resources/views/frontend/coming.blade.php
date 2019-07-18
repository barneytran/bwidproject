@extends('frontend.layouts.master')

@section('content')
    <section class="mainComming">
        <div class="container">
            <div class="boxComming">
                <div class="info"><span>{{trans('frontend.we_are')}}</span>
                    <h4>{{trans('frontend.coming_soon')}}</h4>
                </div>
                <p class="text-center">{{trans('frontend.contact_after')}}!</p><a style="text-transform: uppercase;" href="{{getPageUrlByCode('CONTACT')}}">
                    {{trans('menu.contact_us')}}<i class="fa fa-long-arrow-right"></i></a>
            </div>
        </div>
    </section>
@endsection