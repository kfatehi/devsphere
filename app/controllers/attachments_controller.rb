class AttachmentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    upload = current_user.attachments.new params[:attachment]
    if upload.save
      flash[:notice] = "Upload successful!"
    else
      flash[:alert] = %{
        There was a problem uploading your file.<br><b>
        #{upload.errors.full_messages.join('<br>')}</b>
      }.html_safe
    end
    redirect_to root_url
  end

end
