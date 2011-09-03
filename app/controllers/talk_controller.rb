class TalkController < ApplicationController
  before_filter :prepare_objects
  before_filter :set_last_request_at

  def index
    @posts = Post.threads.page(params[:page])
    @files = Attachment.new_to_old.limit(30)
  end

  def file_database
    @files = Attachment.new_to_old.page(params[:page])
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
  
  def live_update
    # 1 : indicates the presence of user on the website (for online status display)
    # 2 : if any updates have occured on the page
      # a : if a user goes offline 
    @user = current_user
    @online_users = User.online_users
  end

  private
  def prepare_objects
    @new_post = Post.new
    @new_post.attachments.build
    if @body_saver = session[:body_saver]
      session[:body_saver] = nil
    end
  end
end
