class NotificationsController < ApplicationController
  def create
    FriendMailer.notify(current_user, params[:email]).deliver_now
    flash[:message] = "Your becoming a differt human being"
    redirect_to root_urlcreate
  end
end
