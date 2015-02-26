class ReservationMailer < ApplicationMailer
  def notify(host, guest)
    @guest_name = guest.first_name
    @host_name = host.first_name
    mail(to: host.email, subject: "You have a Vagabond waiting for approval!")
  end
end
