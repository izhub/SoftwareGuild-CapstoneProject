$('document').ready(function () {
    // category and tags array
    var categories = [];
    var tags = [];
    categories.push('uncategorized');

    $('#refreshCaptcha').click(function (event) {
        event.preventDefault();
        $('#captcha_image').attr("src", "captcha");
    });

    // tags stuff
    $('#addTag').click(function (event) {
        event.preventDefault();
        addTags();
    });

    $('#tagList').on('click', 'button.btnTag', function (event) {
        event.preventDefault();
        removeTag();
    });

    // handle enter key for tags
    $('#tags').keypress(function (event) {
        if (event.which === 13) {
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
            addCategory();
        }
    });

// functions
    function addTags() {
        var tagSplit = $('#tags').val().split(',');

        for (var i = 0; i < tagSplit.length; i++) {
            var tempTags = tags.toString().toLowerCase();
            var tagItem = tagSplit[i].trim().toString().toLowerCase();

            if (tempTags.indexOf(tagItem) === -1) {
                tags.push(tagSplit[i].trim());
            }
        }

        generateTags();
    }

    function removeTag() {
        var id = $(this).attr('value');

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
        var categoryList = $('#categoryList');

        $('#category').val('');

        if (category.length > 0) {
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


