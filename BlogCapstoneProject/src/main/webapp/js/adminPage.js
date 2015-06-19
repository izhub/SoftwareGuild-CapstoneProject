$(document).ready(function () {
    loadAllPosts();
});

function loadAllsPosts() {
    clearPostTable();
    var items = [];
    var dvdTable = $('#dvdTableContent');
    $.ajax({
        type: 'GET',
        url: 'posts'
    }).success(function (data, status) {
        $.each(dummyData, function (index, post) {
            $('#table-header').text('Posts');
            items.push('<tr><td><a>' + post.postTitle + '</a></td>');
            items.push('<td>' + post.postAuthor + '</td>');
            items.push('<td>');
            $.each(post.postCategories, function (index, category) {
                items.push(category + '&nbsp;&nbsp');
            });
            items.push('</td>');
            items.push('<td>' + post.postStatus + '</td>');
            items.push('<td>' + post.postDate + '</td>');
            items.push('<td><a>Edit</a></td>');
            items.push('<td><a>Delete</a></td></tr>');
        });
        $('#posts-table-content').append(items.join(''));
    });
}

function loadAllPosts() {

    var items = [];
    $.each(dummyData, function (index, post) {
        $('#table-header').text('Posts');
        items.push('<tr><td><a>' + post.postTitle + '</a></td>');
        items.push('<td>' + post.postAuthor + '</td>');
        items.push('<td>');
        $.each(post.postCategories, function (index, category) {
            items.push(category + '&nbsp;&nbsp');
        });
        items.push('</td>');
        items.push('<td>' + post.postStatus + '</td>');
        items.push('<td>' + post.postDate + '</td>');
        items.push('<td><a>Edit</a></td>');
        items.push('<td><a>Delete</a></td></tr>');
    });
    $('#posts-table-content').append(items.join(''));
}




function clearPostTable() {
    $('#post-table').empty();
}

var dummyData = [{postTitle: "Java", postAuthor: "admin", postStatus: "pending", postDate: "06/16/14", postCategories: ["Java", "Web Apps"]},
    {postTitle: ".NET", postAuthor: "root", postStatus: "published", postDate: "06/16/14", postCategories: ["C#"]},
    {postTitle: "MySQL", postAuthor: "marketing", postStatus: "published", postDate: "06/20/14", postCategories: ["Databases", "SQLqueries"]}];