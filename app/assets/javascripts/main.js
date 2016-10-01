// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// solve problem with table row
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});


