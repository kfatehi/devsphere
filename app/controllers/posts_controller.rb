class PostsController < ApplicationController
  before_filter :authenticate_user!
  def create
    post = current_user.posts.new params[:post]
    if post.save
      flash[:notice] = "Nice! Thanks for adding to the discussion"
    else
      flash[:alert] = "There was a problem creating your post"
    end
    redirect_to root_url
  end
end