class AddNewColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :category_id, :integer
    add_column :listings, :max_guests, :integer
    add_column :listings, :address1, :string
    add_column :listings, :address2, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :zip, :integer
    add_column :listings, :shared_bathroom, :boolean
    add_column :listings, :user_id, :integer
    remove_column :listings, :image
    remove_column :listings, :status
    rename_column :listings, :price, :nightly_rate
  end
end
