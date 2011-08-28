module ApplicationHelper
  def current_time
    t = Time.now
    t.strftime('%H:%M UTC') + t.strftime("%z").gsub('0','')
  end
end
