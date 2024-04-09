class WelcomeMailer < ApplicationMailer
  def send_greetings_notification(user)
    @user = user
    mail to: @user.email, sunject: "Thanks for signing up on our site"
  end
end
