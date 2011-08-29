module TalkHelper
  def custom_time(t)
    t.strftime('%H:%M UTC') + t.strftime("%z").gsub('0','')
  end
end
