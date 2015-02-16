class ListingsController < ApplicationController
  def index
    @listings = Listing.where(nil)
    filtering_params(params).each do |key, value|
      @listings = @listings.public_send(key, value) if value.present?
    end
  end

private

  def filtering_params(params)
    params.slice(:city, :max_guests, :category_id, :nightly_rate)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to index_host_listings
    else
      render "new"
    end
  end


  private

  def listing_params
    params.require(:listing).permit(:title,
                                    :description,
                                    :nightly_rate,
                                    :category_id,
                                    :max_guset,
                                    :address1,
                                    :address2,
                                    :city,
                                    :state,
                                    :zip,
                                    :shared_bathroom)
  end
end
