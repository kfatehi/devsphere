class PostsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create]

  def create
    post = current_user.posts.new(params[:post])
    if post.save
      # current_user.update_column(:points, current_user.points + new_points)
      flash[:notice] = "Thanks for contributing!"
      p "Saved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\nSaved\n"
    else
      flash[:alert] = %{
        There was a problem creating your post.<br><b>
        #{post.errors.full_messages.join('<br>')}</b>
      }.html_safe
      p "Failed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\nFailed\n"
    end
    redirect_to root_url
  end
end