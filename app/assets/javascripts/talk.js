$(function() {
  $('.shytoggle').click(function(){
    $(this).next().show();
    $(this).hide();
    
    $.scrollTo($(this).parent() , 800, {easing:'easeOutQuint'} );

    
  });
  $('.shybox .hide_parent').click(function(){
    $(this).parent().hide();
    $(this).parent().prev().show();
  });
});
