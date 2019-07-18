<h3>{{ trans('admin_product.photos') }}</h3>
<ul id="sortable-photos" class="list-photos">
    @isset($project)
        @foreach($project->pictures_array() as $rs)
            @component('admin.layouts.components.li_photo', [
                'photo_path' => $rs
            ])
            @endcomponent
        @endforeach
    @endisset
</ul>

<div class="text-center">
    <button type="button" class="btn btn-primary ckfinder-multi" data-append="#sortable-photos" data-name="photos[]">
        {{ trans('button.add_photos') }}
    </button>
</div>