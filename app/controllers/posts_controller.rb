class PostsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create]
  def create
    new_points = params[:post][:attachments].size + 1
    post = current_user.posts.new(params[:post])
    # This is not working.... accepts_nested_attributes_for doesnt seem to work for this either
    # Probably best to just use a transaction instead of all this bullshit
    if post.save
      current_user.update_column(:points, current_user.points + new_points)
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