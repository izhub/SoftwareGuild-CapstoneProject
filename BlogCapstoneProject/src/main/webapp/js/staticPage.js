$(document).ready(function () {
    loadComments();
});

function loadComments() {
    clearCommentsDiv();
    var items = [];

    $.ajax({
        url: ('../comments/' + $('#postId').val()),
        type: 'GET'
    }).success(function (data, status) {
        $.each(data, function (index, comment) {
            if (comment.commentStatus === 'approved') {
                items.push('<div class="row" id="list-of-comments">');
                items.push('<h5 style="margin:3px;">' + comment.commentAuthorName + '<small style="font-size: 12px; color: royalblue;">&nbsp;&nbsp;'+ comment.commentWebsite + '</small></h5>');
                items.push('<h5 style="font-size: 13px; margin: 3px;">' + comment.commentEmail + '</h5>');
                items.push('<div id="comment-content">');
                items.push('<p>' + comment.commentContent + '</p>');
                items.push('</div></div>');
            }
           
        });
       $('#comments').append(items.join(''));
    });
}

function clearCommentsDiv() {
    $('#comment-content').empty();
}