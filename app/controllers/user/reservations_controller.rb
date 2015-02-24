class User::ReservationsController < ApplicationController
  def index
    if current_user
      if current_user.host?
        @listings = User.find_by(slug: params[:slug]).listings
      elsif current_user.default?
        @reservations = User.find_by(slug: params[:slug]).reservations
      end
    else
      render :not_found
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:notice] = "Reservation successfully cancelled"
      redirect_to :back
    end
  end
end
