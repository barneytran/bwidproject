<div class="row">
    <div class="col-md-3">
        @component('admin.layouts.components.html_select', [
            'label' => trans('admin_career.form.city'),
            'name' => 'cities[]',
            'default' => !empty($career) ? (optional($career->cities()->first())->id ?? null) : '',
            'options' => $cities->pluck('name', 'id')->toArray()
        ])
        @endcomponent
    </div>
    <div class="col-md-3">
        @component('admin.layouts.components.html_select', [
            'label' => trans('admin_career.form.category'),
            'name' => 'category_id',
            'default' => $career->category_id ?? null,
            'options' => $categories->pluck('name', 'id')->toArray()
        ])
        @endcomponent
    </div>
</div>

<div class="row">
    <div class="col-md-3">
        <div class="font-bold col-green">{!! trans("admin_career.form.published_date") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input type="text" class="form-control" id="published_date" name="published_date" data-date-format="{!! JS_DATE !!}"
                       value="{{ $career->published_date_format ?? old('published_date') }}">
                <div id="published_date-container" style="position: relative"></div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="font-bold col-green">{!! trans("admin_career.form.expired_date") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input type="text" class="form-control" id="expired_date" name="expired_date" data-date-format="{!! JS_DATE !!}"
                       value="{{ $career->expired_date_format ?? old('expired_date') }}">
                <div id="expired_date-container" style="position: relative"></div>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col-md-3">
        @component('admin.layouts.components.html_select', [
                'label' => trans('admin_career.form.status'),
                'name' => 'status',
                'default' => $career->status ?? null,
                'options' => $statuses
            ])
        @endcomponent
    </div>

    {{--<div class="col-md-2">--}}
        {{--<div class="form-group">--}}
            {{--<br class="hidden-sm hidden-xs">--}}
            {{--<input type="checkbox" id="accept_aplly" name="accept_aplly"--}}
                   {{--value="1" {!! !empty($career) && $career->accept_aplly ? 'checked' : null !!}>--}}
            {{--<label for="accept_aplly">{!! trans("admin_career.form.accept_aplly") !!}</label>--}}
        {{--</div>--}}
    {{--</div>--}}

    <div class="col-md-3">
        <div class="form-group">
            <br class="hidden-sm hidden-xs">
            <input type="checkbox" id="is_top" name="is_top"
                   value="1" {!! !empty($career) && $career->is_top ? 'checked' : null !!}>
            <label for="is_top">{!! trans("admin_career.form.is_top") !!}</label>
        </div>
    </div>
</div>