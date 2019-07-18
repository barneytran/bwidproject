<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
        	  <div class="panel-heading">
        			<h3 class="panel-title">{{trans('admin_branch.form.choose_position_map')}}</h3>
        	  </div>
        	  <div class="panel-body">
                  <div class="cover">
                      <hr class="line line-hover">
                      <hr class="line line-pos" style="top: {{intval($branch->lng ?? 0)}}px;">
                      <img id="map-line" src="{{System::content('map_desktop','images/our-presence/map.png')}}" style="height: 100%;width: auto">
                      <input type="hidden" name="lng" value="{{ $branch->lng ?? old('lng')}}">
                  </div>
        	  </div>
        </div>
    </div>
</div>
<style>
    .cover{
        position: relative;
    }
    hr.line{
        border-top: 1px solid #8c8b8b;
        width: 100%;
        margin: 0;
        position: absolute;
        top: 0;
    }
    hr.line.line-pos{
        border-top: 1px solid #ff0000;
    }
</style>