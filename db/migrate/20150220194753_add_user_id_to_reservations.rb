class AddUserIdToReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :guest_id, :user_id
    remove_column :reservations, :host_id
  end
end
