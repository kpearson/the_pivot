class ListingImage < ActiveRecord::Base
  mount_uploader :image, ListingImageUploader
  belongs_to :listing
end
