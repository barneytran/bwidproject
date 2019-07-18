@extends("admin.layouts.master")

@section("meta")
@endsection

@section("style")
    <link href="/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet"/>
@endsection

@section("content")
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="body">

                @include('admin.layouts.partials.message')

                @component('admin.layouts.components.form', [
                    'form_method' =>  empty($service) ? 'POST' : 'PUT',
                    'form_url' => empty($service) ? route("admin.service.store") : route("admin.service.update", $service->id)
                ])
                    <!-- Nav tabs -->
                        @include('admin.translation.nav_tab', [
                            'default_tabs' => [
                                [
                                    'id' => 'general',
                                    'name' => trans('admin_tab.general'),
                                    'path' => 'admin.service.partials.general'
                                ]
                            ],
                            'object_trans' => $service ?? null,
                            'default_tab' => 'general',
                            'form_fields' => [
                                ['type' => 'text', 'name' => 'title'],
                                !empty($service) ? ['type' => 'text', 'name' => 'slug'] : null,
                                ['type' => 'textarea', 'name' => 'description'],
                                ['type' => 'ckeditor', 'name' => 'content']
                            ],
                            'form_plugins' => ['ckeditor'],
                            'tab_seo' => true,
                            'metadata' => $metadata ?? null,
                            'translation_file' => 'admin_service'
                        ])

                        {{--Buttons--}}
                        @include("admin.layouts.partials.form_buttons", [
                            "cancel" => route("admin.service.index")
                        ])
                    @endcomponent
                </div>
            </div>
        </div>
    </div>
@endsection

@section("script")
    <script type="text/javascript" src="/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

    <!-- Jquery Validation Plugin Css -->
    <script src="/assets/plugins/jquery-validation/jquery.validate.js"></script>

    @if($composer_locale !== 'en')
        <script type="text/javascript"
                src="/assets/plugins/jquery-validation/localization/messages_{{ $composer_locale }}.js"></script>
    @endif
@endsection