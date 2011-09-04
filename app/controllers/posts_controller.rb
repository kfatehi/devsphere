class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_last_request_at
  
  def create
    post = current_user.posts.new(params[:post])
    if post.save
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

  def update
    @post = Post.find params[:id]
    if @post.recent?
      if @post.update_attributes(params[:post])
        @updated = true
      end
    end
  end

  def destroy
    @post = Post.find params[:id]
    if @post.recent? && @post.destroy
      @destroyed = true
    end
  end

end