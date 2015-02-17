class ListingImage < ActiveRecord::Base
  belongs_to :listing
  mount_uploader :listing_image, ListingImageUploader
end
