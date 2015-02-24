class FriendMailer < ApplicationMailer
  def notify(email, email_for_friend)
    @user = user
    mail(to: email_for_friend, subject: "#{user.name} says youve changed"
  end
end
