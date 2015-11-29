
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    $('.btn-link').popover();

    $('.btn-link').on('click', function (e) {
        $('.btn-link').not(this).popover('hide');
    });

    $("#drpdown").change(function () {

        $("resu").html($("#drpdown").val());
    });
     var desc = false;
    document.getElementById("azSort").onclick = function () {
        sortAlphabetically($('#list'), "li", "p", desc);
        desc = !desc;
        return false;
    };
    document.getElementById("numSort").onclick = function () {
        sortHitrate($('#list'), "li", "div", desc);
        desc = !desc;
        return false;
    };
});
$(function () {

    $('button').on('click', function () {
        var value = $("#user_val").val();
        var r = $('<a class="btn btn-default" >' + value + '</a>');
        $(".result").append(r);
    });
});

function sortAlphabetically(parent, childSelector, keySelector, sortDescending) {
    var items = parent.children(childSelector);
    items.sort(function (a, b) {
        var vA = $(keySelector, a).text().toLowerCase();
        var vB = $(keySelector, b).text().toLowerCase();
        return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
    });
    $("#azSortIcon").removeClass("fa fa-sort-alpha-asc").addClass("fa fa-sort-alpha-desc");
    if (sortDescending) {
        items.sort(function (a, b) {
            var vA = $(keySelector, a).text().toLowerCase();
            var vB = $(keySelector, b).text().toLowerCase();
            return (vA > vB) ? -1 : (vA < vB) ? 1 : 0;
        });
        $("#azSortIcon").removeClass("fa fa-sort-alpha-desc").addClass("fa fa-sort-alpha-asc");
    }

    parent.html(items);
}
function sortHitrate(parent, childSelector, keySelector, sortDescending) {
    var items = parent.children(childSelector);
    items.sort(function (a, b) {
        var vA = $(keySelector, a).text().toLowerCase();
        var vB = $(keySelector, b).text().toLowerCase();
        return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
    });
    $("#numSortIcon").removeClass('fa fa-sort-numeric-asc').addClass("fa fa-sort-numeric-desc");
    if (sortDescending) {
        items.sort(function (a, b) {
            var vA = $(keySelector, a).text();
            var vB = $(keySelector, b).text();
            return (vA > vB) ? -1 : (vA < vB) ? 1 : 0;
        });
        $("#numSortIcon").removeClass('fa fa-sort-numeric-desc').addClass("fa fa-sort-numeric-asc");
    }

    parent.html(items);
}
