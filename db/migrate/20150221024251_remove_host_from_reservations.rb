class RemoveHostFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :host_id
    remove_column :reservations, :guest_id
    add_column :reservations, :user_id, :integer
  end
end
