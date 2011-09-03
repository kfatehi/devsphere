class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def set_last_request_at 
    current_user.update_column(:last_request_at, Time.now) if user_signed_in? 
  end
end
