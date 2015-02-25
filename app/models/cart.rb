class Cart
  attr_reader :data

  def initialize(data)
    @data = data || Hash.new
  end

  def add_listing(params, user_id)
    data["reservations"] ||= []
    listing = Listing.find(params[:listing_id])
    reservation = listing.reservations.new(
      start_date: Date.strptime(params[:check_in], "%m/%d/%Y"),
      end_date: Date.strptime(params[:check_out], "%m/%d/%Y"),
      user_id: user_id
    )
    data["reservations"] << reservation.cart_data
  end

  def count(listing)
    listing.values.reduce(0, :+)
  end

  def remove_listing(params)
    data["reservations"].delete_if do |listing|
      listing["listing_id"] == params["listing_id"].to_i && listing["start_date"] == params["start_date"]
    end
  end
end
