// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// solve problem with table row
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
    
});




$(document).on('turbolinks:load', function() {
  $('.selectpicker').selectpicker({
      size: 10
    });
    
    // fix bug with icons on firefox
    if (navigator.userAgent.indexOf("Firefox") > 0) {
        $('.row-onlain .icon-small').hide();
    }
    
    $('.thumbnail').hover(
        function () {
            $('img',this).stop().animate({opacity: '0.4'}, 300);
        },
        function () {
            $('img',this).stop().animate({opacity: '0.9'}, 300);
        }
    );
})