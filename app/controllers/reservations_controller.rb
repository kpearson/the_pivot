class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @listings = session[:cart]["reservations"].map do |listing|
      @dates = {start_date: listing["start_date"], end_date: listing["end_date"]}
      Listing.find(listing["listing_id"])
    end
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
