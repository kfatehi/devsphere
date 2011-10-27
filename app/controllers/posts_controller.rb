class PostsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create]
  before_filter :set_last_request_at
  
  def create
    post = current_user.posts.new(params[:post])
    if post.save
      current_user.give_points_for(post)
      flash[:notice] = "Thanks for contributing!"
    else
      flash[:alert] = %{
        There was a problem creating your post.<br><b>
        #{post.errors.full_messages.join('<br>')}</b>
      }.html_safe
      session[:body_saver] = post.body  
    end
    redirect_to :back
  end
end