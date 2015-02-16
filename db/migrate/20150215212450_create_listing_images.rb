class CreateListingImages < ActiveRecord::Migration
  def change
    create_table :listing_images do |t|
      t.string :image
      t.integer :listing_id
      t.timestamps null: false
    end
  end
end
