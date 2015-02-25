class HostMailer < ApplicationMailer
  def inform(email, user_contact)
    @user = user
    #attachments['image or file'] = File.read("#{Rails.root}/public/image_file.jpg)
    mail(to: user_contact, subject: "You have a Vagabond waiting for approval!")
  end
end
