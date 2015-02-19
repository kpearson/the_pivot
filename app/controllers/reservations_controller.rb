class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @cart.data.each do |item_id, quantity|
      item = Item.unscoped.find(item_id.to_i)
      item.add_quantity(quantity)
      @reservation.items << item
    end
  end

  def create
    if current_user
      @reservation = Reservation.new(user_id: current_user.id)
      line_items = @reservation.create_line_items(@cart.data)
      @reservation.line_items << line_items
      if @reservation.save
        flash[:notice] = "Your delicious food is on the way"
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = "System error, unable to place reservation"
        redirect_to new_reservation_path
      end
    else
      flash[:notice] = "Please login or signup to continue with checkout"
      redirect_to :back
    end
  end

  def index
    @reservations = User.find(current_user.id).reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
