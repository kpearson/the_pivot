class Admin::ReservationsController < Admin::BaseController
  def index
    @completed_reservations = Reservations.completed
    @paid_reservations = Reservations.paid
    @cancelled_reservations = Reservations.cancelled
    @ordered_reservations = Reservations.ordered
    @reservations = Reservations.all
  end

  def update
    @reservation = Reservations.find(params[:id])
    @reservation.update(status: params[:status])
    redirect_to reservation_path(@reservation.id)
  end

  def filtered_reservations
    @reservations = Reservations.where(status: params[:status])
  end
end
