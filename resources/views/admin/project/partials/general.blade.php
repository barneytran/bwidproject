<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project.form.thumbnail") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $project->thumbnail ?? null,
                'name' => 'thumbnail',
            ])
            @endcomponent
        </div>
    </div>

    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project.form.banner") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $project->banner ?? null,
                'name' => 'banner',
            ])
            @endcomponent
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project.form.category") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <select name="category_id" id="category_id" class="form-control">
                    @foreach($categories as $c)
                        <option value="{{ $c->id }}" {{ !empty($project) && $project->category_id === $c->id ? 'selected' : '' }}>
                            {{ $c->name ?? trans('admin_project_category.empty_name') }}
                        </option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project.form.position") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input class="form-control" type="number" name="position" value="{{ $project->position ?? null }}"/>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_project.form.phone") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input class="form-control" type="text" name="phone" value="{{ $project->phone ?? null }}"/>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-md-4">
        <div class="form-group" style="margin-top: 25px">
            <input type="checkbox" id="active" name="active"
                   value="1" {!! !empty($project) && $project->active ? "checked" : null !!}>
            <label for="active">{!! trans("admin_project.form.active") !!}</label>
        </div>
    </div>
    <div class="col-md-4">
        <div class="font-bold col-green">Email</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input class="form-control" type="email" name="email" value="{{ $project->email ?? null }}"/>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="row">
            <div class="col-md-6">
                <div class="font-bold col-green">{{trans('admin_project.form.lat')}}</div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input class="form-control" type="text" name="lat" value="{{ $project->lat ?? null }}"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="font-bold col-green">{{trans('admin_project.form.lng')}}</div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input class="form-control" type="text" name="lng" value="{{ $project->lng ?? null }}"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>