class TalkController < ApplicationController
  def index
    #later we will add pagination
    @posts = Post.top_level
    @new_user = User.new
    @new_post = Post.new
    @new_attachment = Attachment.new
  end
end
