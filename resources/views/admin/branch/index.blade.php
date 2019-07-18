@extends("admin.layouts.master")

@section("meta")
    <meta name="linkDatatable" content="{{ route('admin.branch.datatable') }}"/>
@endsection

@section("style")
    <!--select 2 plugin-->
    <link rel="stylesheet" href="/assets/plugins/select2/css/select2.min.css"/>

    <!--dataTables plugin-->
    <link rel="stylesheet" href="/assets/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>
@endsection


@section("content")
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <a href="{!! route("admin.branch.create") !!}" class="btn btn-info waves-effect pull-right">
                        <i class="material-icons">add</i>
                        <span>{!! trans("button.create") !!}</span>
                    </a>
{{--                    <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"--}}
{{--                       style="margin-right: 20px"--}}
{{--                       class="btn btn-primary waves-effect pull-right">--}}
{{--                        <i class="material-icons">360</i>--}}
{{--                        <span>{!! trans("button.change_map_image") !!}</span>--}}
{{--                    </a>--}}
                    <h2>
                        {!! trans("admin_branch.list") !!}
                    </h2>
                    <div class="clearfix"></div>

                </div>
                <div class="body">
                    <div class="collapse" id="collapseOne" style="padding: 0;">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="{{route("branch.map_image")}}" method="POST">
                                    <input type="hidden" name="_method" value="PUT">
                                    {{csrf_field()}}
                                    <div class="form-group form-float">
                                        <div class="font-bold col-green">{{trans('admin_branch.table.map_desktop')}}</div>
                                        <div class="form-line">
                                            <input type="text" id="map_desktop" class="form-control" name="map_desktop" value="{{System::content('map_desktop','images/our-presence/map.png')}}">
                                            <button type="button" class="btn btn-primary btn_select_a_file" data-append="#map_desktop" style="position: absolute; top: 2px; right:2px">Or select a file</button>
                                        </div>
                                    </div>
                                    <div class="form-group form-float">
                                        <div class="font-bold col-green">{{trans('admin_branch.table.map_mobile')}}</div>
                                        <div class="form-line">
                                            <input type="text" id="map_mobile" class="form-control" name="map_mobile" value="{{System::content('map_mobile','images/our-presence/map-mb.png')}}">
                                            <button type="button" class="btn btn-primary btn_select_a_file" data-append="#map_mobile" style="position: absolute; top: 2px; right:2px">Or select a file</button>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary waves-effect btn_submit">Save</button>
                                    <button type="reset" class="btn btn-default waves-effect">Reset</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    @include("admin.layouts.partials.message")
                    <table id="datatable" class="table table-bordered table-striped table-hover dataTable"
                           style="width: 100%">
                        <thead>
                        <tr>
                            <th width="40">{!! trans("admin_branch.table.id") !!}</th>
                            <th>{!! trans("admin_branch.table.name") !!}</th>
                            <th>{!! trans("admin_branch.table.city") !!}</th>
                            <th width="150">{!! trans("admin_branch.table.action") !!}</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section("script")
    @include("admin.layouts.partials.modal-delete")

    <!--select 2 plugin-->
    <script src="/assets/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

    <!--dataTables plugin-->
    <script src="/assets/plugins/jquery-datatable/jquery.dataTables.js" type="text/javascript"></script>
    <script src="/assets/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"
            type="text/javascript"></script>


    <script type="text/javascript" src="/assets/admin/js/pages/branch.index.js"></script>
@endsection