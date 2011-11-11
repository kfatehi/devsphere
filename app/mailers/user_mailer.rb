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
    emails = []
    (User.all - [@author]).each do |user|
      emails << user.email
    end
    mail(:to=>"do-not-reply@cry.li", :bcc=>emails, :subject=>"Discussion is brewing @ cry.li")
  end
end
