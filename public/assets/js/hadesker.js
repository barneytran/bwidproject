$(function () {
    let curURL = window.location.pathname;
    if(curURL == '' || curURL == '/' || curURL == '/en'  || curURL == '/vi' || curURL == '/zh' || curURL == '/ko' || curURL == '/ja') return;
    $.each($('#main-menu a'),function () {
        if($(this).attr('href').includes(curURL) || curURL.includes($(this).attr('href')))
            $(this).closest('li').addClass('active').parent().parent().addClass('active').parent().parent().addClass('active');
    });
});