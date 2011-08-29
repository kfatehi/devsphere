$(function() {
  $('.shytoggle').click(function(){
    $(this).next().show();
    $(this).hide();
  });
  $('.shybox .hide_parent').click(function(){
    $(this).parents('.shybox').hide();
    $(this).parents('.shybox').prev().show();
    return false;
  });

  $('.shytoggle').click(function(){
    $(this).next().show();
    $(this).hide();
  });
});
