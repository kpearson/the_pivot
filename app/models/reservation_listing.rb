class ReservationListing < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :listing
end
