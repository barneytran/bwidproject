@php $rand = isset($template) ? 'RAND' : randStrGen(10)  @endphp

<div class="template col-md-4">
    <button class="btn btn-danger" onclick="$(this).parent().remove()" type="button" style="position: absolute; right: 0; z-index: 999;">X</button>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs tab-nav-right" role="tablist">
                @foreach($composer_locales as $key => $value)
                    <li role="presentation" class="{{$key== config('app.locale') ? 'active' : ''}}">
                        <a href="#R{{$rand}}_{{ 'trans' }}_{{ $key }}" data-toggle="tab" aria-expanded="false">{{$value['native']}}</a>
                    </li>
                @endforeach
            </ul>
        </div>
        <div class="tab-content">
            @foreach($composer_locales as $key => $value)
                <div role="tabpanel" class="tab-pane fade {{ $key== config('app.locale') ? 'active in' : '' }}" id="R{{$rand}}_{{ 'trans' }}_{{ $key }}">
                    <div class="col-md-12">
                        <div class="font-bold col-green">{{trans('admin_brochures.form.title')}}</div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input class="form-control" type="text" name="features[{{$rand}}][{{$key}}][title]" value="{{ isset($item) && isset($item[$key]) && isset($item[$key]['title']) ? $item[$key]['title'] : '' }}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="font-bold col-green">{{trans('admin_project.form.description')}}</div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <textarea name="features[{{$rand}}][{{$key}}][description]"  class="form-control" rows="3">{{ isset($item) && isset($item[$key]) && isset($item[$key]['description']) ? $item[$key]['description'] : '' }}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="font-bold col-green">{!! trans("admin_project.form.icon") !!}</div>
            <div class="form-group">
                @component('admin.layouts.components.upload_photo', [
                    'image' => isset($item) ? $item['icon'] : '',
                    'name' => "features[{$rand}][icon]",
                ])
                @endcomponent
            </div>
        </div>
    </div>
</div>