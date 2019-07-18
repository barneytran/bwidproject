<div class="row">
    <div class="col-md-12">
        <div class="font-bold col-green">{{trans('admin_branch.form.city')}}</div>
        <div class="form-group form-float">
            <div class="form-line">
                <select name="city_id" class="form-control city-select2">
                    @foreach($cities as $item)
                        <option value="{{$item->id}}" {{!empty($branch) && $branch->city_id == $item->id ? 'selected' : ''}}>{{$item->name}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="font-bold col-green">{{trans('admin_branch.form.property_type')}}</div>
        <div class="form-group form-float property-type">
            <div class="form-line" style="padding-left: 8px;padding-top: 10px;">
                @foreach($types as $key=>$type)
                    @php
                        $checked = false; $project_id = null;
                        if(!empty($branch))
                        {
                            $checked = in_array($type->id, $branch->project_categories->pluck('id')->toArray());
                            $project_id = optional($type->branch_project_categories()->where('branch_id',$branch->id)->first())->project_id;
                        }
                    @endphp
                <div class="row">
                    <div class="col-md-3">
                        <div style="width: 25px;display: inline-table;">
                            <img style="height: 18px;" src="{{$type->icon}}" alt="">
                        </div>
                        <input type="checkbox" {{$checked ? 'checked' : ''}} id="project_category_id{{$key}}" name="project_category_id[]"
                               value="{{$type->id}}">
                        <label for="project_category_id{{$key}}">{!! $type->name !!}</label>
                    </div>
                    <div class="col-md-7">
                        <select name="project_category_project[{{$type->id}}][]" class="form-control city-select2">
                            <option value="">---</option>
                            @foreach($type->project as $item)
                                <option value="{{$item->id}}" {{$project_id == $item->id ? 'selected' : ''}}>{{$item->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>

