
$(document).ready(function () {
    loadAllComments();
});

function loadAllComments() {
    clearCommentsTable();
    var items = [];
    $.ajax({
        url: 'comments',
        type: 'GET'
    }).success(function (data, status) {
        $.each(data, function (index, comment) {

            $('#table-header').text('Comments');
            items.push('<tr><td><p style="margin: 1px;">' + comment.commentAuthorName + '</p><p style="margin:1px; color: royalblue;">&nbsp;&nbsp;' + comment.commentWebsite + '</p></td>');

            var date = new Date(comment.commentDate);
            var formattedDate = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear();
            items.push('<td>' + comment.commentContent + '</td>');
            items.push('<td>' + formattedDate + '</td>');
            
            items.push('<td>' + comment.postTitle + '</td>');
            
            if (comment.commentStatus === 'approved') {
                items.push('<td><p>approved</p></td>');
            } else {
                items.push('<td><p>unapproved</p></td>');
            }
            
            if (comment.commentStatus === 'approved') {
                items.push('<td><a onClick="unapproveComment(' + comment.commentId + ')">disapprove</a></td>');
            } else {
                items.push('<td><a onClick="approveComment(' + comment.commentId + ')">approve</a></td>');
            }

        });
        $('#comments-table-content').append(items.join(''));
    });
}

function unapproveComment(id) {
    $.ajax({
        type: 'PUT',
        url: 'unapproveComment/' + id
        
    }).success(function (data, status) {
        clearCommentsTable();
        loadAllComments();
    });
}

function approveComment(id) {
    $.ajax({
        type: 'PUT',
        url: 'approveComment/' + id
        
    }).success(function (data, status) {
        clearCommentsTable();
        loadAllComments();
    });
}

function clearCommentsTable() {
    $('#comments-table-content').empty();
}



///TEST DATA///
var dummyData = [{commentId: 1, commentDate: new Date(), commentAuthorName: 'frank', commentContent: 'no way hosea', commentStatus: 'approved', commentWebsite: 'yoyo.com', commentPostTitle: 'Java for Beginners'}];

