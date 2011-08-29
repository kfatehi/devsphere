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
    if opts[:only_post]
      locals = {:post=>post, :depth=>nil, :only_post=>true}
    else
      depth = (opts[:depth].nil? ? 0 : opts[:depth]+1)
      locals = {:post=>post, :depth=>depth, :only_post=>false}
    end
    render :partial => 'post', :locals=>locals
  end
end
