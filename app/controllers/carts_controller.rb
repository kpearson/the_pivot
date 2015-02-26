class CartsController < ApplicationController
  def create
    if current_user
      @cart.add_listing(params, current_user.id)
      session["cart"] = @cart.data
      flash[:notice] = "Listing Successfully Added To Reservations"
      redirect_to :back
    else
      flash[:notice] = "Please log in to book this listing"
      redirect_to :back
    end
  end

  def destroy
    @cart.remove_item(params[:item_id])
    session["cart"] = @cart.data
    redirect_to new_reservation_path
  end
end
