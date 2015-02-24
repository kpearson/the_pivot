require "rails_helper"

RSpec.describe FriendMailer, :type => :mailer do
  it "it creates a notification for the host" do
    user = create(:user)
    FriendMailer.notify(user, 'kitpearson@me.com').deliver_now
    result = ActionMailer::Base.deliveries.last

    expect result
    expect result.to.include? ('kitpearosn@me.com')
  end
end
