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

  def create
    require 'pry' ; binding.pry
    if current_user
      @reservation = Reservation.new(listing_id: params[:listing_id])
      @reservation.user = User.find(session)
      @reservation = Reservation.new(user_id: session["cart"]["reservations"].first["user_id"])
      if @reservation.save
        flash[:notice] = "Request Sent!"
      else
        flash[:notice] = "Unable to send request"
      end
    end
  end

  private
  #
  # def reservation_params
  #   params.require(:reservation).permit(:listing_id, :user_id, :start_date, :end_date)
  # end
end
