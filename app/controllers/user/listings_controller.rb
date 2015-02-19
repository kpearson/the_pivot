class User::ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = current_user.listings.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      current_user.update_attributes(role: 1)
      redirect_to user_listing_path(current_user.slug, @listing.id)
    else
      render "new"
    end
  end


    def edit
      @listing = Listing.find(params[:id])
    end

    def update
      @listing = Listing.find(params[:id])
      @listing.update(listing_params)
      redirect_to :back
    end

    def destroy
      @listing = Listing.find(params[:id])
      @listing.destroy
      redirect_to user_show_path
    end

  private

  def listing_params
    params.require(:listing).permit(:title,
                                    :description,
                                    :nightly_rate,
                                    :category_id,
                                    :max_guests,
                                    :address1,
                                    :address2,
                                    :city,
                                    :state,
                                    :zip,
                                    :shared_bathroom)
  end
end
