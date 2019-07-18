@extends('frontend.layouts.master')

@section('style')
@endsection
@section('meta-title')
    <title>{{$career->name}}</title>
@endsection
@section('content')
    @include('themes.partials.base',['banner'=>'frontend/images/career/bg-career-model-3.jpg'])
    <section class="ourCareer">
        <div class="container">
            <div class="titleHeading titleHeading--content" data-waypoint="100%">
                <h1>{{$career->name}}</h1>
                <ul class="career-link">
                    <li><i class="fa fa-briefcase"></i><span><strong>Department</strong>: {{optional($career->category)->name}}</span></li>
                    <li><i class="fa fa-map-marker"></i><span><strong>Location</strong>: {{optional($career->cities()->first())->name}}</span></li>
                    <li><i class="fa fa-calendar"></i><span><strong>Expired date</strong>: <span>{{format_show_time($career->expired_date)}}</span></span></li>
                </ul>
            </div>
            <div class="document mediaEffect-2" data-waypoint="100%">
                <div class="heading-content">Job Description</div>
                <div>
                    {!! $career->description !!}
                </div>
                <div class="heading-content">Job Requirement</div>
                <div>
                    {!! $career->requirement !!}
                </div>
                <div class="heading-content">Benefit</div>
                <div>
                    {!! $career->benefit !!}
                </div>
                <div class="heading-content">Resume Requirement</div>
                <div>
                    {!! $career->resume_requirement !!}
                </div>
                {{-- <div class="text-center"><a class="btn-load" href="mailto:{{System::content('email')}}">apply now</a></div> --}}
                <div class="text-center"><a class="btn-load" href="mailto:hr@bwidjsc.com">apply now</a></div>
                <div class="text-center" style="margin-top: 0.9375em;"><a class="link-hotline" style="font-weight: 500;color: #00a8df;"><i class="fa fa-envelope"></i> E-mail: hr@bwidjsc.com</a></div>
            </div>
            @if($other_career->count())
            <div class="relativeBox mediaEffect-3" data-waypoint="100%">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="titleHeading--news">Other JOBS</div>
                    </div>
                    <div class="col-sm-3 titleHeading--link"><a class="btn-view" href="{{route('career.opening.index')}}"><i class="fa fa-bars"></i>View all</a></div>
                </div>
                <div class="careerList" id="slideCareer">
                    @foreach($other_career as $item)
                    <div class="careerList__item">
                        <div class="row">
                            <div class="col-12">
                                <div class="title"><a href="{{route('career.opening.detail',['slug'=>$item->slug])}}">{{$item->name}}</a></div>
                            </div>
                            <div class="col-6">
                                <div class="branch"><i class="fa fa-briefcase"></i>{{optional($item->category)->name}}</div>
                            </div>
                            <div class="col-6">
                                <div class="add"><i class="fa fa-map-marker"></i>{{optional($item->cities()->first())->name}}</div>
                            </div>
                            <div class="col-12"><a class="btn-view-2" href="{{route('career.opening.detail',['slug'=>$item->slug])}}">View detail </a></div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            @endif
        </div>
    </section>
@endsection

@section('script')
@endsection