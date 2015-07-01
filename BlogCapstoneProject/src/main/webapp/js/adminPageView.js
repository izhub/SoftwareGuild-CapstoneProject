$(document).ready(function () {
    loadAllPages();
});

function loadAllPages() {
    clearPostTable();
    var items = [];
    $.ajax({
        type: 'GET',
        url: 'adminPages'
    }).success(function (data, status) {
        $.each(data, function (index, post) {
            $('#table-header').text('Static Pages');
            items.push('<tr><td><a href="post/' + post.postId + '">' + post.postTitle + '</a></td>');
            
            var date = new Date(post.postDate);
            var formattedDate = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear();
            
            items.push('<td>' + post.postUserName + '</td>');
            items.push('<td>' + post.postStatus + '</td>');
            items.push('<td>' + formattedDate + '</td>');
            items.push('<td><a href="displayEditView/' + post.postId + '">Edit</a></td>');
            items.push('<td><a onclick="deletePost(' + post.postId + ')">Delete</a></td></tr>');
        });
        $('#posts-table-content').append(items.join(''));
    });
}
function deletePost(postId) {
    var confirmation = confirm("Are you sure you want to delete this page?");
    if (confirmation) {
        $.ajax({
            type: 'DELETE',
            url: 'post/' + postId  
        }).success(function () {
           loadAllPages(); 
        });
    }
}

function clearPostTable() {
    $('#posts-table-content').empty();
}
