class AddReservationListingsTable < ActiveRecord::Migration
  def change
    create_table :reservation_listings do |t|
      t.references :reservation, index: true
      t.references :listing, index: true
    end
    add_foreign_key :reservation_listings, :reservations
    add_foreign_key :reservation_listings, :listings
    add_column :reservation_listings, :quantity, :integer, default: 1
  end
end
