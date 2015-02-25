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
      flash[:notice] = "Reservation successfully deleted"
      redirect_to :back
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(status: params[:status])
      flash[:notice] = "Reservation status successfully changed to #{params[:status]}"
      redirect_to :back
    else
      flash[:notice] = "Reservation status could not be updated"
      redirect_to :back
    end
  end
end
