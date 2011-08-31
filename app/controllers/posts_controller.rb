class PostsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create]
  def create
    points = current_user.points
    post = current_user.posts.new(params[:post])
    if post.save
      points += 1
      if attach = params[:attachment]
        attach.each do |n,f|
          attachment = current_user.attachments.new f.merge(:post_id=>post.id)
          if attachment.save
            points += 1
          else
            flash[:alert] = %{
              There was a problem with your attachment.<br><b>
              #{attachment.errors.full_messages.join('<br>')}</b>
            }
            redirect_to :back
          end
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