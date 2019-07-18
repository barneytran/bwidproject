@extends("admin.layouts.master")

@section("meta")

@endsection

@section("style")

@endsection

@section("content")
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="body">

                @include("admin.layouts.partials.message")

                @component('admin.layouts.components.form', [
                'form_method' =>  empty($news_category) ? 'POST' : 'PUT',
                'form_url' => empty($news_category) ? route("admin.news_category.store") : route("admin.news_category.update", $news_category->id)
                ])
                        <div class="row">
                            <div class="col-md-4">
                                <div class="font-bold col-green">Banner</div>
                                <div class="form-group">
                                    @component('admin.layouts.components.upload_photo', [
                                        'image' => $news_category->banner ?? null,
                                        'name' => 'banner',
                                    ])
                                    @endcomponent
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group form-float">
                                    <div class="font-bold col-green">{{ trans('admin_page_block.form.parent') }}</div>
                                    <div class="form-line focused">
                                        <select name="parent_id" id="parent_id" class="form-control">
                                            <option value="0">----</option>
                                            @foreach($news_category_parent as $c)
                                                <option value="{{ $c->id }}" {{ !empty($news_category) && $news_category->parent_id === $c->id ? 'selected' : '' }}>
                                                    {{ $c->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group form-float">
                                    <div class="font-bold col-green">{{ trans('admin_news_category.form.code') }}</div>
                                    <div class="form-line focused">
                                        <input type="text" id="code" class="form-control" name="code" value="{{ $news_category->code ?? '' }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!-- Nav tabs -->
                        @include('admin.translation.nav_tab', [
                            'object_trans' => $news_category ?? null,
                            'default_tab' => $composer_locale,
                            'form_fields' => [
                                ['type' => 'text', 'name' => 'name'],
                                !empty($news_category) ? ['type' => 'text', 'name' => 'slug'] : null,
                            ],
                            'tab_seo' => true,
                            'translation_file' => 'admin_news_category'
                        ])

                        {{--Buttons--}}
                        @include("admin.layouts.partials.form_buttons", [
                            "cancel" => route("admin.news_category.index")
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

    @if($composer_locale !== 'en')
        <script type="text/javascript"
                src="/assets/plugins/jquery-validation/localization/messages_{{ $composer_locale }}.js"></script>
    @endif

    <script type="text/javascript" src="/assets/admin/js/pages/news_category.create.js?v=1.0"></script>
@endsection