// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// Custom Javascript

$(document).ready(function() {
	
  $('.dragbox').each(function(){
    $(this).hover(function(){
      $(this).find('h2').addClass('collapse');
    }, function(){
      $(this).find('h2').removeClass('collapse');
    })
    .find('h2').hover(function(){
      $(this).find('.configure').css('visibility', 'visible');
    }, function(){
      $(this).find('.configure').css('visibility', 'hidden');
    })
    .click(function(){
      $(this).siblings('.dragbox-content').toggle();
    })
    .end()
    .find('.configure').css('visibility', 'hidden');
  });
  $('.column').sortable({
    connectWith: '.column',
    handle: 'h2',
    cursor: 'move',
    placeholder: 'placeholder',
    forcePlaceholderSize: true,
    opacity: 0.4,
    stop: function(event, ui){
      $(ui.item).find('h2').click();
    }
  })
  .disableSelection();
  $('input').click(function(){
    $(this).focus();
  });
  $('textarea').click(function(){
    $(this).focus();
  });
});
