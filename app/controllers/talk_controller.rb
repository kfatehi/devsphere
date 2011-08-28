class TalkController < ApplicationController
  def index
    #later we will add pagination
    @posts = Post.top_level.order("created_at DESC")
  end
end
