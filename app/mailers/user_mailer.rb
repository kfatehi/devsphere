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
    users = []
    (User.all - [@author]).each do |user|
      users << user
    end
    mail_arr << mail(:to=>"do-not-reply@cry.li", :bcc=>users :subject=>"Discussion is brewing @ cry.li")
  end
end
