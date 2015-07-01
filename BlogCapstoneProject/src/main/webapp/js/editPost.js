$(document).ready(function () {
    populateTagsAndCategories();

    $('#commit').click(function () {
        event.preventDefault();

        editPost('publish');
    });

    $('#draft').click(function () {
       event.preventDefault();
       
       editPost('draft');
    });
    
    $('#approval').click(function () {
        event.preventDefault();
        
        editPost('pending');
    });

    function editPost(status) {
        var tinymce_editor_id = tinymce.editors[0].id;

        // get only the checked categories
        var checkedCategories = [];
        $('#categoryList input[type=checkbox]').each(function () {
            if (this.checked) {
                checkedCategories.push($(this).attr("name"));
            }
        });

        $.ajax({
            url: "../post/" + $('#postId').val(),
            type: "PUT",
            data: JSON.stringify({
                postId: $('#postId').val(),
                postTitle: $('#postTitle').val(),
                postContent: tinymce.get(tinymce_editor_id).getContent(),
                postType: $('#postType').val(),
                postCategories: checkedCategories.toString(),
                postStatus: status,
                postTags: tags.toString()
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            statusCode: {
                201: function () {
                    $('#postTitle').val('');
                    tinymce.get(tinymce_editor_id).setContent('');
                    if ($('#postType').val() === 'blog') {
                        $('#edit-confirmation').append('<h5 id="added-message" style="color: green;"><strong>Post has been edited.</strong></h5>');
                    } else {
                        $('#edit-confirmation').append('<h5 id="added-message" style="color: green;"><strong>Page has been edited.</strong></h5>');
                    }
                    setTimeout(function () {
                        $('#added-message').fadeOut('slow');
                    }, 2000);
                }
            }
        });
        $('#tagList').empty();
        $('#categoryList').empty();
        $('#add-confirmation').empty();
    }


    // tags stuff
    $('#addTag').click(function (event) {
        event.preventDefault();
        addTags();
    });

    $('#tagList').on('click', 'button.btnTag', function (event) {
        event.preventDefault();
        removeTag($(this));
    });

    // handle enter key for tags
    $('#tags').keypress(function (event) {
        if (event.which === 13) {
            event.preventDefault();
            addTags();
        }
    });

    // categories stuff
    $('#addCategory').click(function (event) {
        event.preventDefault();

        addCategory();
    });

    // handle 'enter' key for categories
    $('#category').keypress(function (event) {
        if (event.which === 13) {
            event.preventDefault();
            addCategory();
        }
    });
// functions

    function populateTagsAndCategories() {
        $('#categoryList input[type=checkbox]').each(function () {
            categories.push($(this).attr("name"));
        });

        $('#tagList .btnTag').each(function () {
            tags.push($(this).text().trim().toLowerCase());
        });

    }

    function addTags() {
        var tagSplit = $('#tags').val().split(',');

        for (var i = 0; i < tagSplit.length; i++) {
            var tagItem = tagSplit[i].trim().toString().toLowerCase();

            if (tagItem.match(/^[\w\-\#\s]+$/)) {
                if (tags.indexOf(tagItem) === -1) {
                    tags.push(tagSplit[i].trim().toString().toLowerCase());
                }
            }
        }

        generateTags();
    }

    function removeTag(button) {
        var id = button.attr('value');

        tags.splice(id, 1);

        generateTags();
    }

    function generateTags() {
        var tagList = $('#tagList');

        tagList.empty();
        $('#tags').val('');

        if (tags.length > 0) {
            $.each(tags, function (index, element) {
                if (element.length > 0) {
                    tagList.append($('<span>')
                            .attr({
                                'class': 'tag'
                            })
                            .append($('<button>')
                                    .attr({
                                        'type': 'button',
                                        'class': 'btnTag btn btn-default btn-xs',
                                        'style': 'margin-top: 2px',
                                        'value': index
                                    })
                                    .append($('<span>')
                                            .attr({
                                                'id': index,
                                                'class': 'glyphicon glyphicon-remove'
                                            })
                                            )
                                    )
                            );
                    $('#' + index).after(' ' + element);
                }
            });
            $('.tag').after(' ');
        }
    }

    function addCategory() {
        var category = $('#category').val().trim();
        var categoryId = category.toLowerCase();
        categoryId = categoryId.replace(/\ /g, '_');
        var categoryList = $('#categoryList');

        $('#category').val('');

        if (category.length > 0 && category.match(/^[\w\-\s]+$/)) {

            if (categories.indexOf(categoryId) === -1) {
                categories.push(categoryId);
                categoryList.append('<br>');
                categoryList.append($('<input>')
                        .attr({
                            'type': 'checkbox',
                            'id': categoryId,
                            'name': category,
                            'checked': 'checked'
                        }));
                $('#' + categoryId).after(' ' + category);
            } else {
                $('#' + categoryId).prop('checked', true);
            }
        }
    }

});