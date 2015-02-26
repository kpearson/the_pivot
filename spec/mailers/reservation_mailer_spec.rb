require "rails_helper"

describe ReservationMailer, :type => :mailer do
  it "it creates a notification for the host" do
    user = create(:user)
    ReservationMailer.notify(user, user).deliver_now
    result = ActionMailer::Base.deliveries.last

    expect result
    expect result.to.include? ('kitpearosn@me.com')
  end
end
