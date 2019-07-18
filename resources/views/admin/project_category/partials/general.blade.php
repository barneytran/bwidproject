<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project_category.form.thumbnail") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $project_category->thumbnail ?? null,
                'name' => 'thumbnail',
            ])
            @endcomponent
        </div>
    </div>

    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project_category.form.banner") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $project_category->banner ?? null,
                'name' => 'banner',
            ])
            @endcomponent
        </div>
    </div>
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project_category.form.icon") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $project_category->icon ?? null,
                'name' => 'icon',
            ])
            @endcomponent
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project_category.form.position") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input class="form-control" type="number" name="position" value="{{ $project_category->position ?? null }}" />
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group" style="margin-top: 25px;">
            <input type="checkbox" id="active" name="active"
                   value="1" {!! !empty($project_category) && $project_category->active ? "checked" : null !!}>
            <label for="active">{!! trans("admin_project_category.form.active") !!}</label>
        </div>
    </div>
</div>