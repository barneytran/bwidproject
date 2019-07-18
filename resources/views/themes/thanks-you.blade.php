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
            <div class="container">
                @if(!empty($blocks['THANKYOU'][0]))
                    <h1 class="titleHeading" data-waypoint="100%">{{$blocks['THANKYOU'][0]->name}}</h1>
                    <div class="innerContact" data-waypoint="100%">
                        <div class="row">
                            <div class="col-md-12 col-12">
                                <div class="formLocation" id="formLocationHD" style="padding-left:0;">
                                    {!! $blocks['THANKYOU'][0]->content !!}
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
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