jQuery(function ($) {
    var linkDatatable = $('meta[name=linkDatatable]').attr('content');

    var _table = $("#datatable");

    _table.DataTable({
        processing: true,
        serverSide: true,
        lengthMenu: [[10, 25, 50, 100, 200,-1], [10, 25, 100, 200, "All"]],
        pageLength: 20,
        order: [[0, "desc"]],
        ajax: {
            url: linkDatatable,
        },
        columns: [
            {data: 'id', name: 'id'},
            {data: 'name', name: 'name', orderable: false},
            {data: 'log_name', name: 'log_name', orderable: false},
            {data: 'description', name: 'description', orderable: false},
            {data: 'created_at', name: 'created_at', orderable: false},
        ],
        language: {
            url: '/assets/plugins/jquery-datatable/languages/'+COMPOSER_LOCALE+'.json'
        }
    });
});