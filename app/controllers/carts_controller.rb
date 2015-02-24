class CartsController < ApplicationController
  # before_action :load_cart

  def create
    @cart.add_listing(params, current_user.id)
    session[:cart] = @cart.data
    flash[:notice] = "Listing Successfully Added To Reservations"
    redirect_to :back
  end

  def destroy
    @cart.remove_item(params[:item_id])
    session[:cart] = @cart.data
    redirect_to new_reservation_path
  end

  private
  #
  # def update_cart
  #   listing = Listing.find(params[:listing_id])
  #   @cart.add_listing(listing)
  #   session[:cart] = @cart.data
  # end


  def update_existing_cart
    # if session[:cart][:listing_id] => params[:cart][:start_date] => params[:cart][:start_date]
    #   session[:cart][params[:cart][:item_id]] = (session[:cart][params[:cart][:item_id]].to_i + params[:cart][:quantity].to_i).to_s
    # else
    #   session[:cart][params[:cart][:item_id]] = params[:cart][:quantity].to_s
    # end
  end
end
