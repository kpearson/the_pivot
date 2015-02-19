class ListingsController < ApplicationController
  def index
    @listings = Listing.where(nil)
    filtering_params(params).each do |key, value|
      @listings = @listings.public_send(key, value) if value.present?
    end
  end

  def show
    @listing = Listing.find_by(id: params[:id])
  end


private

  def filtering_params(params)
    params.slice(:city, :max_guests, :category_id, :nightly_rate)
  end
end
