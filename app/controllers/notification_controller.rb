class NotificationsController < ApplicationController
  def create
    ListingMailer.notify(current_user, params[:email]).deliver_now
    flash[:message] = "Your becoming a differt human being"
    redirect_to root_url
  end
end
