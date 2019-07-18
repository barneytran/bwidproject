<div class="row">
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_slider.form.image") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $slider->image ?? null,
                'name' => 'image',
            ])
            @endcomponent
        </div>
    </div>
    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_slider.form.image_mobile") !!}</div>
        <div class="form-group">
            @component('admin.layouts.components.upload_photo', [
                'image' => $slider->image_mobile ?? null,
                'name' => 'image_mobile',
            ])
            @endcomponent
        </div>
    </div>

    <div class="col-md-4">
        <div class="font-bold col-green">{!! trans("admin_slider.form.key") !!}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <select name="key" class="form-control">
                    <option value="{{ SLIDER_HOME }}" {{isset($slider) && $slider->key == SLIDER_HOME ? 'selected' : ''}} >HOME</option>
                    <option value="{{ SLIDER_CAREER_CULTURE }}" {{isset($slider) && $slider->key == SLIDER_CAREER_CULTURE ? 'selected' : ''}} >CAREER-CULTURE</option>
                </select>
            </div>
        </div>
    </div>
</div>