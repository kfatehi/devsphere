class PostsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create]
  def create
    points = current_user.points
    post = current_user.posts.new(params[:post])
    if post.save
      points += 1
      if attach = params[:attachment]
        attach.each do |n,f|
          current_user.attachments.create f.merge(:post_id=>post.id)
          points += 1
        end
      end
      current_user.update_column(:points, points)
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