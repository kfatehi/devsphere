function liveUpdate () { $.get('talk/live_update') };

$(function() {
  liveUpdate();
  $('.shytoggle').click(function(){
    $(this).next().show();
    $(this).next().find('textarea#post_body').focus()
    return false;
  });
  $('.shybox .hide_parent').click(function(){
    $(this).parents('.shybox').hide();
    return false;
  });

  $('.post .expand').live('click', function() {
    var button = $(this);
    $(this).parent().next('div.expandable').toggle('fast', 'easeOutQuad', function () {
      button.text(($(this).is(':visible') ? '[-]' : '[+]'));
    });
    return false;
  });

  $('.jump_to_parent').live('click', function() {
    $.scrollTo($(this).parents('.post')[1], 'slow', {easing:'easeInQuad'})
    return false;
  });

  $('.add_attachment').click(function(){
    var n = $(this).siblings('.attachment_fields').length;
    var fields = $(this).siblings('.attachment_fields').first().clone();

    fields.children('input[type="file"]').attr('id', 'post_attachments_attributes_'+n+'_file');
    fields.children('select').attr('id', 'post_attachments_attributes_'+n+'_category');

    fields.children('input[type="file"]').attr('name', 'post[attachments_attributes]['+n+'][file]');
    fields.children('select').attr('name', 'post[attachments_attributes]['+n+'][category]');
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

  setInterval(liveUpdate, 20000); // FIXME implement me

});
