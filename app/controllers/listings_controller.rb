class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new

  end

  def create
    @listing = Listing.new(params[:listing])
    if @listing.save
      redirect_to index_host_listings
    else
      render "new"
    end
  end
end
