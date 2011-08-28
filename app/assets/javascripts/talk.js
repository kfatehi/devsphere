$(function() {
  $('.shytoggle').click(function(){
    $(this).next().show();
    $(this).hide();
  });
  $('.shybox .hide_parent').click(function(){
    $(this).parent().hide();
    $(this).parent().prev().show();
  });
});
