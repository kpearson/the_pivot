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
      flash[:notice] = "Reservation successfully changed to #{params[:status]}"
      redirect_to :back
    else
      flash[:notice] = "Reservation status could not be updated"
      redirect_to :back
    end
  end

  def create
    if current_user
      set_reservation_attributes(params)
      if @reservation.save
        @cart.data["reservations"].delete_if do |listing|
          listing["listing_id"] == params["listing_id"].to_i && listing["start_date"] == params["start_date"]
        end
        flash[:notice] = "Request Sent!"
        redirect_to :back
      else
        flash[:notice] = "Unable to send request"
        redirect_to :back
      end
    end
  end

  private

  def set_reservation_attributes(params)
    @reservation = Reservation.new(listing_id: params[:listing_id])
    @reservation.user = User.find(params["user_id"])
    @reservation.start_date = Date.parse(params["start_date"])
    @reservation.end_date = Date.parse(params["end_date"])
  end
end
