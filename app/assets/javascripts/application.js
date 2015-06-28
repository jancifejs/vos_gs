// app/assets/javascripts/application.js



//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap

//= require turbolinks
//= require_tree .

$(document).on('page:change', function () {


    $("#query").autocomplete({
        source: $("#query").data('autocomplete-source'),
        minLength: 2
    });



});