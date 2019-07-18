@extends("admin.layouts.master")

@section("meta")
@endsection

@section("style")
    <link rel="stylesheet" href="/assets/plugins/select2/css/select2.min.css"/>
    <style>
        fieldset.product-recommend-wrapper {
            border: 1px solid #2196f3;
            padding: 15px;
            margin-bottom: 15px;
        }
        fieldset.product-recommend-wrapper > legend {
            border-width: 0;
            display: inline-block;
            padding: 0 10px;
            width: auto;
        }
    </style>
@endsection

@section("content")
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="body">

                @include("admin.layouts.partials.message")

                @component('admin.layouts.components.form', [
                'form_method' =>  empty($project) ? 'POST' : 'PUT',
                'form_url' => empty($project) ? route("admin.project.store") : route("admin.project.update", $project->id)
                ])
                        @include('admin.translation.nav_tab', [
                            'object_trans' => $project ?? null,
                            'default_tabs' => [
                                [
                                    'id' => 'general',
                                    'name' => trans('admin_tab.general'),
                                    'path' => 'admin.project.partials.general'
                                ],
                                [
                                    'id' => 'photos',
                                    'name' => trans('admin_tab.photos'),
                                    'path' => 'admin.project.partials.photos'
                                ],
                                [
                                    'id' => 'project_feature',
                                    'name' => trans('admin_tab.project_feature'),
                                    'path' => 'admin.project.partials.project_features'
                                ]
                            ],
                            'default_tab' => 'general',
                            'form_fields' => [
                                ['type' => 'text', 'name' => 'name'],
                                !empty($project) ? ['type' => 'text', 'name' => 'slug'] : null,
                                ['type' => 'text', 'name' => 'address'],
                                ['type' => 'text', 'name' => 'contact_person'],
                                ['type' => 'text', 'name' => 'project_file', 'has_url'=>true],
                                ['type' => 'ckeditor', 'name' => 'description']
                            ],
                            'tab_seo' => true,
                            'translation_file' => 'admin_project',
                            'form_plugins' => ['ckeditor']
                        ])
                        @include("admin.layouts.partials.form_buttons", [
                            "cancel" => route("admin.project.index")
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

    <script type="text/javascript" src="/assets/admin/js/pages/project.create.js?v=1.0"></script>
@endsection