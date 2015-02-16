class ListingImage < ActiveRecord::Base
  belongs_to Listing
  mount_uploader :listing_image, ItemImageUploader
end
