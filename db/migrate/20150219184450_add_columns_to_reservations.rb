class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :listing_id, :integer
    change_column :reservations, :status, :string, :default => "pending"
    add_column :reservations, :host_id, :integer
    rename_column :reservations, :user_id, :guest_id
  end
end
