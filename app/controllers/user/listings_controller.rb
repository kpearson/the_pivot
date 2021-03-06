class User::ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @listing_images = @listing.listing_images.all
    @remaining_images = @listing_images[1..-1]
  end

  def edit_index
    @listings = Listing.where(user_id: current_user.id)
  end

  def new
    @listing = current_user.listings.new
    @listing_image = @listing.listing_images.build
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if params["listing_images"]
      params["listing_images"]["images"].each do |i|
        @listing.listing_images.build(image: i)
      end
    end
    if @listing.save
      redirect_to user_listing_path(current_user.slug, @listing.id)
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    @listing_image = @listing.listing_images.build
  end

  def update
    @listing = Listing.find(params[:id])
     if params["listing_images"]
       params["listing_images"]["images"].each do |i|
       @listing.listing_images.build(image: i)
     end
   end
   if @listing.update_attributes(listing_params)
      redirect_to user_listing_path(current_user.slug, @listing.id)
    else
      render :edit
    end
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
    :shared_bathroom,
    listing_images_attributes: [:id,
      :listing_id,
      :image]
      )
    end
  end
