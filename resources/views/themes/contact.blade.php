@extends('frontend.layouts.master')

@section('style')
    <style>
        label.error{
            float: left;
            color:red;
            margin-bottom: 8px;
        }
    </style>
@endsection

@section('content')
    @include('themes.partials.base',['banner'=>'images/business-model/bg-business-model.jpg'])
    <section class="mainContact">
        @if(!empty($blocks['INTRODUCE']) && $block = $blocks->get('INTRODUCE')->first())
            <div class="container">
                <h1 class="titleHeading" data-waypoint="100%">{{$block->name}}</h1>
                <div class="innerContact" data-waypoint="100%">
                    <div class="row">
                        <div class="col-md-6 col-12">
                            @include('frontend.layouts.partials.alert')
                            <div class="formContact">
                                <form class="formValid" method="post" action="{{route('page.storeContact')}}" >
                                    {{csrf_field()}}
                                    <div class="row">
                                        @if(!empty($blocks['SUBJECT-CONTACT']) && $block1 = $blocks->get('SUBJECT-CONTACT')->first())
                                        <div class="col-12">
                                            <div class="form-group">
                                                <select name="subject" class="selectpicker show-tick" title="{{$block1->name}} *">
                                                    @foreach($block1->children as $item)
                                                    <option value="{{$item->name}}" {{$item->name == old('subject') ? 'selected' : ''}}>{{$item->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        @endif
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <input class="form-control" value="{{old('name')}}" type="text" id="name" name="name" placeholder="{{trans('contact.name')}} *">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <input class="form-control" type="text" value="{{old('phone')}}"  id="phone" name="phone" placeholder="{{trans('contact.tel')}} *">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <input class="form-control" type="email" name="email" value="{{old('email')}}"  id="email" placeholder="{{trans('contact.email')}} *">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <input class="form-control" type="text" id="companyname" value="{{old('company')}}"  name="company" placeholder="{{trans('contact.company')}}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea class="form-control" id="companyprofile" name="company_profile"  rows="4" placeholder="{{trans('contact.company_profile')}}">{{old('company_profile')}}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea class="form-control" id="infomation" rows="4" name="information" placeholder="{{trans('contact.information')}}">{{old('information')}}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-12">
                                        <div class="g-recaptcha" data-sitekey="{{config('services.google.recaptcha')}}"></div>
                                        </div>
                                        <div class="col-lg-4 col-5 d-flex align-items-center">
                                            <button class="btn btn-submit" type="submit"> <i class="icon fa fa-long-arrow-right"></i>{{trans('button.submit')}}</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="formLocation" id="formLocationHD">
                                <h3 class="titleHeading titleHeading--medium">{{trans('frontend.bwid')}}</h3>
                                @foreach($block->children as $item)
                                    <h3 class="titleIcon"><span>{{$item->name}}</span></h3>
                                    {!! $item->content !!}
                                @endforeach
                                <div class="boxChat"><img src="{{System::content('weixin')}}" alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endif
    </section>
@endsection

@section('script')
    <script src="https://www.google.com/recaptcha/api.js?hl={{$composer_locale}}"></script>
    <script src="assets/plugins/jquery-validation/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".formValid").validate({
                rules: {
                    subject: 'required',
                    name: "required",
                    email: {
                        required: true,
                        email: true
                    },
                    phone: {
                        required: true,
                        minlength: 9,
                        maxlength: 15
                    }
                },
                messages: {
                    subject: '{{trans('contact.enter_subject')}}',
                    name: "{{trans('home.r_name')}}",
                    email: {
                        required: "{{trans('home.r_email')}}",
                        email: "{{trans('home.e_valid')}}"
                    },
                    phone: {
                        required: "{{trans('home.r_phone')}}",
                        minlength: "{{trans('home.min_phone')}}",
                        maxlength: "{{trans('home.max_phone')}}"
                    }
                }
            });
        });
    </script>
    <script>
        $('#formLocationHD ul li:first-child').prepend('<i class="icon_pin"></i>');
        $('#formLocationHD ul li:nth-child(2)').prepend('<i class="icon_phone"></i>');
        $('#formLocationHD ul li:nth-child(3):not(:last)').prepend('<i class="icon_phone"></i>');
        $('#formLocationHD ul li:last-child').prepend('<i class="icon_mail"></i>');
    </script>
@endsection