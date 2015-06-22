$(document).ready(function () {
    loadAllPosts();
});

function loadAllPosts() {
    clearPostTable();
    var items = [];
    $.ajax({
        type: 'GET',
        url: 'posts'
    }).success(function (data, status) {
        $.each(data, function (index, post) {
            $('#table-header').text('Posts');
            items.push('<tr><td><a>' + post.postTitle + '</a></td>');
            
            var date = new Date(post.postDate);
            var formattedDate = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear();
            
            if (post.postUserId === 1) {
                items.push('<td>admin</td>');
            } else {
                items.push('<td>marketing</td>');
            }
            items.push('<td>');
//            $.each(post.postCategories, function (index, category) {
//                items.push(category + '&nbsp;&nbsp'); 
//            });
            items.push('</td>');
            items.push('<td>' + post.postStatus + '</td>');
            items.push('<td>' + formattedDate + '</td>');
            items.push('<td><a>Edit</a></td>');
            items.push('<td><a onclick="deletePost(' + post.postId + ')">Delete</a></td></tr>');
        });
        $('#posts-table-content').append(items.join(''));
    });
}
function deletePost(postId) {
    var confirmation = confirm("Are you sure you want to delete this post?");
    if (confirmation) {
        $.ajax({
            type: 'DELETE',
            url: 'post/' + postId  
        }).success(function () {
           loadAllPosts(); 
        });
    }
}

//function loadAllPosts() {
//
//    var items = [];
//    $.each(dummyData, function (index, post) {
//        $('#table-header').text('Posts');
//        items.push('<tr><td><a>' + post.postTitle + '</a></td>');
//        items.push('<td>' + post.postAuthor + '</td>');
//        items.push('<td>');
//        $.each(post.postCategories, function (index, category) {
//            items.push(category + '&nbsp;&nbsp');
//        });
//        items.push('</td>');
//        items.push('<td>' + post.postStatus + '</td>');
//        items.push('<td>' + post.postDate + '</td>');
//        items.push('<td><a>Edit</a></td>');
//        items.push('<td><a>Delete</a></td></tr>');
//    });
//    $('#posts-table-content').append(items.join(''));
//}

function clearPostTable() {
    $('#posts-table-content').empty();
}




///TEST DATA////
var dummyData = [{postTitle: "Java", postAuthor: "admin", postStatus: "pending", postDate: "06/16/14", postCategories: ["Java", "Web Apps"]},
    {postTitle: ".NET", postAuthor: "root", postStatus: "published", postDate: "06/16/14", postCategories: ["C#"]},
    {postTitle: "MySQL", postAuthor: "marketing", postStatus: "published", postDate: "06/20/14", postCategories: ["Databases", "SQLqueries"]}];