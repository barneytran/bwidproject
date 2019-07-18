@extends('frontend.layouts.master')

@section('style')
    <style>
        .searchResult__item{
            cursor: pointer;
        }
    </style>
@endsection

@section('content')
    <section class="searchHeading" data-waypoint="100%">
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1 col-12">
                    <form class="searchHeading__form" action="{{route('page.search')}}" method="get">
                        <p class="searchHeading__form__text">{{trans('frontend.search_for')}}</p>
                        <div class="form-group"><i class="ic_search"></i>
                            <input class="form-control" title="{{trans('frontend.search')}}" type="text" name="q" value="{{ strip_tags(request()->get('q')) }}">
                            <button class="btnRemove" type="button"><i class="ic_close"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <section class="searchResult" data-waypoint="100%">
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1 col-12">
                    <p class="searchResult__text">{{trans('frontend.search_result_for')}} <span class="searchResult__text__color">“{{ strip_tags(request()->get('q')) }}”</span></p>
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="searchResult__item" onclick="location.href='{{route('page.search',['q'=>request()->get('q'),'type'=>0])}}'"><a href="#"></a><span class="searchResult__item__text">{{trans('frontend.all')}}</span><span class="searchResult__item__number">{{$pages['total'] ?? 0}}</span></div>
                        </div>
                        <div class="col-lg-2">
                            <div class="searchResult__item" onclick="location.href='{{route('page.search',['q'=>request()->get('q'),'type'=>1])}}'"><a href="#"></a><span class="searchResult__item__text">{{trans('frontend.our_businesses')}}</span><span class="searchResult__item__number">{{$collect1_count ?? 0}}</span></div>
                        </div>
                        <div class="col-lg-2">
                            <div class="searchResult__item" onclick="location.href='{{route('page.search',['q'=>request()->get('q'),'type'=>2])}}'"><a href="#"></a><span class="searchResult__item__text">{{trans('frontend.property_leasing')}}</span><span class="searchResult__item__number">{{$collect2_count ?? 0}}</span></div>
                        </div>
                        <div class="col-lg-2">
                            <div class="searchResult__item" onclick="location.href='{{route('page.search',['q'=>request()->get('q'),'type'=>3])}}'"><a href="#"></a><span class="searchResult__item__text">{{trans('frontend.media_center')}}</span><span class="searchResult__item__number">{{$collect3_count ?? 0}}</span></div>
                        </div>
                        <div class="col-lg-2">
                            <div class="searchResult__item" onclick="location.href='{{route('page.search',['q'=>request()->get('q'),'type'=>4])}}'"><a href="#"></a><span class="searchResult__item__text">{{trans('frontend.careers')}}</span><span class="searchResult__item__number">{{$collect4_count ?? 0}}</span></div>
                        </div>
                    </div>

                    <div>
                        @foreach($collects as $item)
                        <div class="resultList">
                            <div class="resultList__category"><i class="ic_s_small"></i><span>{{$item->getTypeName()}}</span></div>
                            <h3 class="resultList__title"><a href="{{$item->url}}">{{$item->title}}</a></h3>
                            <p class="resultList__text">{{$item->description}}</p>
                        </div>
                        @endforeach
                    </div>

                    @if($pages['pages_count'] > 1)
                    <nav class="text-center">
                        <ul class="pagination pagination--2">
                            @php $previous_page = $pages['current_page'] > 1 ? $pages['current_page']-1 : null; $previous_url = route('page.search',['q'=>request()->get('q'),'page'=>$previous_page, 'type'=>request()->get('type')]); @endphp
                            <li class="page-item {{ $previous_page ? '' : 'disabled' }}"><a class="page-link" href="{{ $previous_page ? $previous_url : 'javascript:void(0)' }}" aria-label="Previous"><span aria-hidden="true"><i class="ic-link ic-link--pagi"></i></span><span class="sr-only">Previous</span></a></li>
                            @foreach(range(1, $pages['pages_count']) as $i)
                                <li class="page-item {{$i == $pages['current_page'] ? 'active' : ''}}"><a class="page-link" href="{{route('page.search',['q'=>request()->get('q'),'page'=>$i, 'type'=>request()->get('type')])}}">{{$i}}</a></li>
                            @endforeach
                            @php $next_page = $pages['current_page'] < $pages['pages_count'] ? $pages['current_page']+1 : null; $next_url = route('page.search',['q'=>request()->get('q'),'page'=>$next_page, 'type'=>request()->get('type')]); @endphp
                            <li class="page-item {{ $next_page ? '' : 'disabled' }}"><a class="page-link" href="{{ $next_page ? $next_url : 'javascript:void(0)' }}" aria-label="Next"><span aria-hidden="true"><i class="ic-link ic-link--pagi ic-link--pagiright"></i></span><span class="sr-only">Next</span></a></li>
                        </ul>
                    </nav>
                    @endif
                </div>
            </div>
        </div>
    </section>
@endsection

@section('script')
@endsection