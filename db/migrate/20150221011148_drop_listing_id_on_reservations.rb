class DropListingIdOnReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :listing_id
  end
end
