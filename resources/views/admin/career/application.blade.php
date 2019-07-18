@extends("admin.layouts.master")

@section("meta")
    <meta name="linkDatatable" content="{{ route('admin.career.application.datatable') }}"/>
@endsection

@section("style")
    <!--dataTables plugin-->
    <link rel="stylesheet" href="/assets/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>
@endsection


@section("content")
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        {!! trans("admin_career.list") !!}
                    </h2>
                    <div class="clearfix"></div>
                </div>
                <div class="body">
                    <table id="datatable" class="table table-bordered table-striped table-hover dataTable"  style="width: 100%">
                        <thead>
                        <tr>
                            <th width="40">{!! trans("admin_career.table.id") !!}</th>
                            <th>{!! trans("admin_career.table.employer") !!}</th>
                            <th>{!! trans("admin_career.table.position") !!}</th>
                            <th>{!! trans("admin_career.table.phone") !!}</th>
                            <th>{!! trans("admin_career.table.created_at") !!}</th>
                            <th width="150">{!! trans("admin_career.table.action") !!}</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section("script")

    <custtom id="details-template" class="hidden">
        <p><strong>{!! trans("admin_career.table.email") !!}:</strong> APPLY_EMAIL</p>
        <p><strong>{!! trans("admin_career.table.content") !!}:</strong></p>
        <p> APPLY_CONTENT </p>
        <p>APPLY_FILES</p>
    </custtom>

    <!--dataTables plugin-->
    <script src="/assets/plugins/jquery-datatable/jquery.dataTables.js" type="text/javascript"></script>
    <script src="/assets/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js" type="text/javascript"></script>

    <script type="text/javascript" src="/assets/admin/js/pages/career_apply.index.js"></script>
@endsection