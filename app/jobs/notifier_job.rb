class NotifierJob < ActiveJob::Base
  queue_as :default

  def perform(user, user_email)
    ListingMailer.inform(current_user, params[:email]).deliver
  end
end
