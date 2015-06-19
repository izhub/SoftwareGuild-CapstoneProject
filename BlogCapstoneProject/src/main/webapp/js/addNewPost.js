$(document).ready(function () {
   loadTheCats(); 
});

function loadCategories() {
    clearCategories();
    
    $.ajax({
        type: "GET",
        url:"categories"
    }).success(function (data, status) {
       
    });    
    var randomVar;
}

function loadTheCats() {
    clearCategories();
    var items = [];
    $.each(dummyCategories, function (index, category) {
          items.push('<div class="<div class="checkbox"><label><input type="checkbox" value="">' + category + '</label></div>'); 
       }); 
    $('#category-check-box').append(items.join(''));
}

var dummyCategories = ["Java", "Web", "AJAX", "JSON", "JSF"];

function clearCategories() {
    $('#category-check-box').empty();
}