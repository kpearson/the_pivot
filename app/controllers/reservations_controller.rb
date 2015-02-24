class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @listings = Listing.find(current_user.id)
  end

  def create
  end

  def index
    @reservations = User.find(current_user.id).reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
