class UserMailer < ActionMailer::Base
  default from: "do-not-reply@cry.li"
  
  def welcome_email(user)
    @user = user
    @url = "http://cry.li/talk"
    mail(:to=>user.email, :subject=>"Welcome to the devsphere @ cry.li")
  end
  def notification_email(post)
    @author = post.user
    @post = post
    (User.all - [@author]).each do |user|
      mail(:to=>user.email, :subject=>"Discussion is brewing @ cry.li")
    end
  end
end
