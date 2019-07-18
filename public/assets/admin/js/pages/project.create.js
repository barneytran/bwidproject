jQuery(function ($) {
    $('#select-product').select2({
        width: '100%'
    }).on('change', function(){
        var product_ids = $(this).val() || [];
        var ele_exists = [];
        $('.product-recommend-wrapper').each(function(){
            var product_id = $(this).attr('data-product-id');
            // console.log(product_id, product_ids);
            if (product_id && product_id != '__PRODUCT_ID__') {
                if ($.inArray(product_id, product_ids) < 0) {
                    $(this).remove();
                } else {
                    ele_exists.push(product_id);
                }
            }
        });

        product_ids.forEach(function(pid){
            if ($.inArray(pid, ele_exists) >= 0) {
                return;
            }
            var $ele_clone = $('.product-recommend-wrapper[data-product-id="__PRODUCT_ID__"]');
            var $ele_cloned = $ele_clone.clone();
            var pname = $('option[value="' + pid + '"]', '#select-product').text() || '';
            $ele_cloned.insertAfter($ele_clone);
            $ele_cloned.show();
            $ele_cloned.attr('data-product-id', pid);
            var clone_html = $ele_cloned.html();
            clone_html = clone_html.replace(/__PRODUCT_ID__/gim, pid);
            clone_html = clone_html.replace(/__PRODUCT_NAME__/gim, pname);
            $ele_cloned.html(clone_html);

        });
    }).trigger('change');


    var validateRules = {

    };
    
    for (let key in COMPOSER_LOCALES) {
        if(LOCALES_REQUIRE.indexOf(key) !== -1){
            validateRules[`${key}[name]`] = {required: true};
        }
    }

    $('#form-form').validate({
        focusInvalid: true,
        ignore: "",
        highlight: function(element) {
            $(element).closest('.tab-pane').addClass("tab-error");
            $(element).addClass("input-error");
            var tab_content= $(element).closest('form');
            if($(".active.tab-error label.error").length == 0){
                var _id = $(tab_content).find(".tab-error:not(.active)").attr("id");
                $('a[href="#' + _id + '"]').tab('show');
            }

            $(element).parents('.form-line').addClass('error');
        },
        unhighlight: function(element) {
            $(element).closest('.tab-pane').removeClass("tab-error");
            $(element).removeClass("input-error");

            $(element).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        },
        rules: validateRules
    });

    let template = $('.template-hide').html();
    $('.add-project-feature').click(function () {
        let rand = Math.random().toString(36).substr(2, 10);
        $('.list-project-features').append(template.replace(/RAND/g, rand));
    });

});