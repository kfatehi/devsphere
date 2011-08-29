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

  $('.shift_click').click(function(){
    
  });

  $('.add_attachment').click(function(){
    var n = $(this).siblings('.attachment_fields').length;
    var fields = $(this).siblings('.attachment_fields').first().clone();
    fields.children('input').attr('id', 'attachment_'+n+'_file');
    fields.children('input').attr('name', 'attachment['+n+'][file]');
    $(this).after('<div class="attachment_fields">'+fields.html()+'</div>');
    return false;
  });
  $('.remove_attachment').live('click', function(){
    var num_attachments = $(this).parent().siblings('.attachment_fields').length;
    if (num_attachments > 0)
      $(this).parent().remove();
    else
      $(this).siblings('input').val('');
    return false;
  });
});
