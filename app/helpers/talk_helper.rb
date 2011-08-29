module TalkHelper
  def custom_time(t)
    t.strftime('%H:%M UTC') + t.strftime("%z").gsub('0','')
  end

  def link_to_new_post(text, opts={})
    render :partial => 'new_post', :locals=>{:link_text=>text, :parent=>opts[:parent]}
  end

  def can_nest?(depth)
    depth < Post::DEPTH_LIMIT
  end

  def render_post(post, opts={})
    depth = (opts[:depth].nil? ? 0 : opts[:depth]+1)
    render :partial => 'post', :locals=>{:post=>post, :depth=>depth}
  end
end
