class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    if session["cart"]
      @listings = session["cart"]["reservations"].map do |listing|
        @dates = {start_date: listing["start_date"], end_date: listing["end_date"]}
        Listing.find(listing["listing_id"])
      end
    else
      @listings = []
    end
  end
end
