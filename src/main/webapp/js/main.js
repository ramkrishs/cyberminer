
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    $('.btn-link').popover();

    $('.btn-link').on('click', function (e) {
        $('.btn-link').not(this).popover('hide');
    });


});
$(function () {

    $('button').on('click', function () {
        var value = $("#user_val").val();
        var r = $('<a class="btn btn-default" >' + value + '</a>');
        $(".result").append(r);
    });
});

