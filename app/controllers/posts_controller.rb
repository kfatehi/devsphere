class PostsController < ApplicationController
  before_filter :authenticate_user!
  def create
    post = current_user.posts.new(params[:post])
    if post.save
      if attach = params[:attachment]
        attach.each {|n,f| current_user.attachments.create f.merge(:post_id=>post.id)}
      end
      flash[:notice] = "Thanks for contributing!"
    else
      flash[:alert] = %{
        There was a problem creating your post.<br><b>
        #{post.errors.full_messages.join('<br>')}</b>
      }.html_safe
    end
    redirect_to root_url
  end
end