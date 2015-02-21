class AddHostToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :host_id, :integer
    add_column :reservations, :guest_id, :integer
    remove_column :reservations, :user_id
  end
end
