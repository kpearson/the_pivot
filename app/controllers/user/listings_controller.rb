class User::ListingsController < ApplicationController
  def show
    @user = User.find_by(slug: params[:slug])
    @listing = Listing.find(params[:id])
  end
end
