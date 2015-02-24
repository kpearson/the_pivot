class HostMailer < ApplicationMailer
  def notify(email, email_for_host)
    @user = user
    mail(to: email_for_host, subject: "You have a Vagabond waiting for approval!"
  end
end
