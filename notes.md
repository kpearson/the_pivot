scope querys for resouses to the user that owns the resouses

user the before_action to hide actiin behind login.

We need a user listings show page and route.


class NotificationsController < ApplicationController
  def create
    ReservationMailer.notify(current_user, params[:email]).deliver_now
    flash[:message] = "Your becoming a differt human being"
    redirect_to new_reservation_path
  end
end
