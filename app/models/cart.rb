class Cart
  attr_reader :data

  def initialize(data)
    @data = data || Hash.new
  end

  def add_listing(params, user_id)
    data[:reservations] ||= []
    listing = Listing.find(params[:listing_id])
     reservation = listing.reservations.new(
      start_date: params[:check_in],
      end_date: params[:check_out],
      user_id: user_id
    )
    data[:reservations] << reservation.cart_data
  end

  def count(listing)
    listing.values.reduce(0, :+)
  end

  def remove_item(item_id)
    @params[item_id] -= 1
    @params.delete_if { |_item, quantity| quantity == 0 }
  end
end
