$(document).ready(function () {
    loadCategoriesTest();
});

$('#commit').click(function () {
    event.preventDefault();
    var tinymce_editor_id = tinymce.editors[0].id;
    $.ajax({
        url: "post",
        type: "POST",
        data: JSON.stringify({
            postTitle: $('#postTitle').val(),
            postContent: tinymce.get(tinymce_editor_id).getContent(),
            postType: $('#postType').val()
        }),
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        dataType: 'json',
        statusCode: {
            201: function () {
                $('#postTitle').val('');
                tinymce.get(tinymce_editor_id).setContent('');
                if ($('#postType').val() === 'blog') {
                    $('#add-confirmation').append('<h5 id="added-message" style="color: green;"><strong>Post has been added.</strong></h5>');
                } else {
                    $('#add-confirmation').append('<h5 id="added-message" style="color: green;"><strong>Page has been added.</strong></h5>');
                }
                setTimeout(function () {
                    $('#added-message').fadeOut('slow');
                }, 2000);
            }
        }
    });
    $('#add-confirmation').empty();
});


function loadCategories() {
    clearCategories();
    var items = [];
    $.ajax({
        type: "GET",
        url: "categories"
    }).success(function (data, status) {
        $.each(dummyCategories, function (index, category) {
            items.push('<div class="<div class="checkbox"><label><input type="checkbox" value="">' + category + '</label></div>');
            $('#category-check-box').append(items.join(''));
        });
    });
}

function loadCategoriesTest() {
    clearCategories();
    var items = [];
    $.each(dummyCategories, function (index, category) {
        items.push('<div class="<div class="checkbox"><label><input type="checkbox" value="">' + category + '</label></div>');
    });
    $('#category-check-box').append(items.join(''));
}











////////////TEST DATA////////////////

var dummyCategories = ["Java", "Web", "AJAX", "JSON", "JSF"];
function clearCategories() {
    $('#category-check-box').empty();
}