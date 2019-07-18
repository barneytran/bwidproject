@extends("admin.layouts.master")

@section("meta")

@endsection

@section("style")
    <link rel="stylesheet" href="/assets/plugins/select2/css/select2.min.css"/>
@endsection

@section("content")
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="body">

                @include("admin.layouts.partials.message")

                @component('admin.layouts.components.form', [
                'form_method' =>  empty($project_category) ? 'POST' : 'PUT',
                'form_url' => empty($project_category) ? route("admin.project_category.store") : route("admin.project_category.update", $project_category->id)
                ])
                    <!-- Nav tabs -->
                        @include('admin.translation.nav_tab', [
                            'object_trans' => $project_category ?? null,
                            'default_tabs' => [
                                [
                                    'id' => 'general',
                                    'name' => trans('admin_tab.general'),
                                    'path' => 'admin.project_category.partials.general'
                                ]
                            ],
                            'default_tab' => 'general',
                            'form_fields' => [
                                ['type' => 'text', 'name' => 'name'],
                                !empty($project_category) ? ['type' => 'text', 'name' => 'slug'] : null,
                                ['type' => 'ckeditor', 'name' => 'description']
                            ],
                            'tab_seo' => true,
                            'translation_file' => 'admin_project_category',
                            'form_plugins' => ['ckeditor']
                        ])

                        {{--Buttons--}}
                        @include("admin.layouts.partials.form_buttons", [
                            "cancel" => route("admin.project_category.index")
                        ])
                    @endcomponent

                </div>
            </div>
        </div>
    </div>
@endsection

@section("script")
    <!-- Jquery Validation Plugin Css -->
    <script src="/assets/plugins/jquery-validation/jquery.validate.js"></script>
    <script src="/assets/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    @if($composer_locale !== 'en')
        <script type="text/javascript"
                src="/assets/plugins/jquery-validation/localization/messages_{{ $composer_locale }}.js"></script>
    @endif

    <script type="text/javascript" src="/assets/admin/js/pages/project_category.create.js?v=1.0"></script>
@endsection