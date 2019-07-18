<div>
    <h3 style="float: left;">{{ trans('admin_tab.project_feature') }}</h3>
    <button type="button" style="float: right;margin-top: 20px;" class="btn btn-primary add-project-feature">
        {{ trans('button.add_feature') }}
    </button>
</div>
<div class="template-hide">
    @include('admin.project.partials.component.project_feature',['template'=>true])
</div>
<div style="clear: both">
    <div class="row list-project-features" >
        @if(isset($project))
        @foreach($project->features_array() as $item)
            @include('admin.project.partials.component.project_feature',['item'=>$item])
        @endforeach
        @endif
    </div>
</div>

<style>
    .template{
        border: 1px solid rgba(0, 188, 212, 0.52);
    }
    .template-hide{
        display: none;
    }
</style>