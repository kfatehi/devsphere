class TalkController < ApplicationController
  before_filter :prepare_objects
  def index
    #later we will add pagination
    @posts = Post.threads.page(params[:page])
    @files = Attachment.new_to_old.limit(30)
  end

  def user_profile
    @user = User.find params[:id]
    @posts = @user.posts
  end

  def single_thread
    @post = Post.find(params[:id]).top_level
  end

  def permalink
    @post = Post.find(params[:id])
    render :single_thread if @post.top_level?
  end

  private
  def prepare_objects
    @new_user = User.new
    @new_post = Post.new
    @new_attachment = Attachment.new
  end
end
