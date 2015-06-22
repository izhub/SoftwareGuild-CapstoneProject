$(document).ready(function () {
loadAllPosts();
});

function loadAllPosts() {
    clearPost();
    var items = [];
    var content = [];
    $.ajax({
        type: 'GET',
        url: 'posts'
    }).success(function (data, status) {
        $.each(data, function (index, post) {
            items.push('<h3>' + post.postTitle + '</h3>');;
            var date = new Date(post.postDate);
            var formattedDate = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear();
            
//            if (post.postUserId === 1) {
//                items.push('<td>admin</td>');
//            } else {
//                items.push('<td>marketing</td>');
//            }
            
//            $.each(post.postCategories, function (index, category) {
//                items.push(category + '&nbsp;&nbsp'); 
//            });
            
            items.push('<div><p>Author     ' + formattedDate + '     <a href="#">Categories</a>     <a href="#">Tags</a></p></div>');
            var postContent = post.postContent;
            var summary = postContent.substring(0, 40);
            content.push('<p>' + summary + '</p>');
        });
        $('#blog-posts').append(items.join(''));
    });
}

function clearPost() {
    $('#blog-posts').empty();
}