<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_service.form.image") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $service->image ?? null,
                'name' => 'image',
            ])
            @endcomponent
        </div>
    </div>

    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_service.form.banner") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $service->banner ?? null,
                'name' => 'banner',
            ])
            @endcomponent
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4" style="display: none;">
        <div class="font-bold col-green">{!! trans("admin_service.form.category") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <select name="service_type" id="service_type" class="form-control">
                    <option value="{{ SERVICE_TYPE_WHY_NOW }}" {{ !empty($service) && $service->service_type === SERVICE_TYPE_WHY_NOW ? 'selected' : '' }}>{{ SERVICE_TYPE_WHY_NOW }}</option>
                    <option value="{{ SERVICE_TYPE_VALUE_ADDED }}" {{ !empty($service) && $service->service_type === SERVICE_TYPE_VALUE_ADDED ? 'selected' : '' }}>{{ SERVICE_TYPE_VALUE_ADDED }}</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <input type="checkbox" id="active" name="active"
                   value="1" {!! !empty($service) && $service->active ? "checked" : null !!}>
            <label style="margin-top: 25px" for="active">{!! trans("admin_service.form.active") !!}</label>
        </div>
    </div>
</div>