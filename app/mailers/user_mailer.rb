class UserMailer < ApplicationMailer
  default from: 'menno.development@gmail.com'

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end
end
