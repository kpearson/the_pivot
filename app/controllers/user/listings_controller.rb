class User::ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
  end
end
