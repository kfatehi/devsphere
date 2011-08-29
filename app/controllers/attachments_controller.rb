class AttachmentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    upload = current_user.attachments.new params[:attachment]
    if upload.save
      flash[:notice] = "Nice! Thanks for adding to the discussion"
    else
      flash[:alert] = "There was a problem uploading your file:<br>#{upload.errors.full_messages}"
    end
    redirect_to root_url
  end
end
