class Reservation < ActiveRecord::Base
  validates :user_id, :start_date, :end_date, :listing_id, presence: true
  belongs_to :listing
  belongs_to :user
  scope :pending, -> { where(status: "pending") }
  scope :past, -> { where(status: "past") }
  scope :paid, -> { where(status: "paid") }
  scope :cancelled, -> { where(status: "cancelled") }

  def guest
    user
  end

  def create_reservation_listings(cart_items)
    cart_items.map do |item_id, quantity|
      LineItem.create(item_id: item_id.to_i, quantity: quantity)
    end
  end

  def total(reservation_listings)
    reservation_listings.map do |reservation_listing|
      (line_item.quantity * reservation_listing.item.price) / 100
    end.reduce(:+)
  end

  def formatted_created_at
    created_at.strftime("%m/%d/%Y at: %I:%M %p")
  end

  def find_user_info(user_id)
    User.find(user_id)
  end
end
