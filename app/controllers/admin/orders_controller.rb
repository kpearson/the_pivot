class Admin::ReservationsController < ApplicationController
  def index
    @completed_reservations = Reservation.completed
    @paid_reservations = Reservation.paid
    @cancelled_reservations = Reservation.cancelled
    @ordered_reservations = Reservation.ordered
    @reservations = Reservation.all
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: params[:status])
    redirect_to order_path(@reservation.id)
  end

  def filtered_reservations
    @reservations = Reservation.where(status: params[:status])
  end
end
