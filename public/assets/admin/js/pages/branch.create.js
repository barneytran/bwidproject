jQuery(function ($) {
    $('#form-form').validate({
        focusInvalid: false,
        highlight: function (element) {
            $(element).closest('.tab-pane').addClass("tab-error");
            $(element).addClass("input-error");
            var tab_content = $(element).closest('form');
            if ($(".active.tab-error label.error").length == 0) {
                var _id = $(tab_content).find(".tab-error:not(.active)").attr("id");
                $('a[href="#' + _id + '"]').tab('show');
            }

            $(element).parents('.form-line').addClass('error');
        },
        unhighlight: function (element) {
            $(element).closest('.tab-pane').removeClass("tab-error");
            $(element).removeClass("input-error");

            $(element).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        },
        ignore: "",
        rules: {
            'type': {required: true},
            'parent_id': {required: true},
            'city_id': {required: true},
            'en[name]': {required: true},
            'vi[name]': {required: true},
            //'vi[address]': {required: true},
            //'en[address]': {required: true},
            'email' : {email:true},
            'phone' : {minlength:8, maxlength: 15},
            'fax' : {minlength:8, maxlength: 15},
            // lat: {
            //     required: function () {
            //         if ($.trim($("#address").val())) {
            //             return true;
            //         }
            //         else {
            //             return false;
            //         }
            //     }
            // }
        }
    });

    function formatState (state) {
        if (!state.id) { return state.text; }
        let $state = $(
            '<span><img style="height: 15px" src="' +  $(state.element).data('icon') + '" class="img-flag" /> ' + state.text + '</span>'
        );
        return $state;
    }
    $('.select2').select2({
        templateResult: formatState
    });

    $('.city-select2').select2();

    $('img#map-line').mousemove(function (e) {
        let top = e.pageY - $(this).offset().top;
        $('hr.line.line-hover').css({top:top});
    });

    $(document).ready(function(){
        $('.cover').click(function (e) {
            let top = e.pageY - $(this).offset().top;
            $('input[name="lng"]').val(top);
            $('hr.line.line-pos').css({top:top});
        });
    });
});