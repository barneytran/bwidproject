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
    <style>
        .property-type .select2-container--default .select2-selection--single{
            border: 1px solid #ccc !important;
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
                    'form_method' =>  empty($branch) ? 'POST' : 'PUT',
                    'form_url' => empty($branch) ? route("admin.branch.store") : route("admin.branch.update", $branch->id)
                    ])
                        @include('admin.translation.nav_tab', [
                            'object_trans' => $branch ?? null,
                            'default_tabs' => [
                                [
                                    'id' => 'general',
                                    'name' => trans('admin_tab.general'),
                                    'path' => 'admin.branch.partials.general'
                                ],
                            ],
                            'default_tab' => 'general',
                            'form_fields' => [
                                ['type' => 'text', 'name' => 'name'],
                                //['type' => 'text', 'name' => 'open_time'],
                            ],
                            'translation_file' => 'admin_branch'
                        ])
                        @include("admin.layouts.partials.form_buttons", [
                            "cancel" => route("admin.branch.index")
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

    <script type="text/javascript" src="/assets/admin/js/pages/branch.create.js?v=1.0"></script>
@endsection