class DropReservationListingsTable < ActiveRecord::Migration
  def change
    drop_table :reservation_listings
  end
end
