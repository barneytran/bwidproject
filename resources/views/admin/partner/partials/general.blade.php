<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_partner.form.photo") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $partner->photo ?? null,
                'name' => 'photo',
            ])
            @endcomponent
        </div>
    </div>

    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_partner.form.logo") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $partner->logo ?? null,
                'name' => 'logo',
            ])
            @endcomponent
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_partner.form.position") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input type="number" class="form-control" name="position" value="{{ !empty($partner) ? $partner->position : '0' }}" required min="0">
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="font-bold col-green">Link</div>
        <div class="form-group form-float">
            <div class="form-line">
                <input type="text" class="form-control" name="link" value="{{ !empty($partner) ? $partner->link : '' }}" >
            </div>
        </div>
    </div>
</div>