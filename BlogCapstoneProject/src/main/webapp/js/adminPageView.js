$(document).ready(function () {
    loadAllPages();
});

function loadAllPages() {
    clearPostTable();
    var items = [];
    $.ajax({
        type: 'GET',
        url: 'pages'
    }).success(function (data, status) {
        $.each(data, function (index, post) {
            $('#table-header').text('Static Pages');
            items.push('<tr><td>' + post.postTitle + '</td>');
            
            var date = new Date(post.postDate);
            var formattedDate = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear();
            
            if (post.postUserId === 1) {
                items.push('<td>admin</td>');
            } else {
                items.push('<td>marketing</td>');
            }            items.push('<td>' + post.postStatus + '</td>');
            items.push('<td>' + formattedDate + '</td>');
            items.push('<td><a>Edit</a></td>');
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
