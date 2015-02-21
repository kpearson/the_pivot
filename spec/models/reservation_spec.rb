require "rails_helper"

RSpec.describe Reservation, type: :model do
  let (:reservation) {
    Reservation.create(user_id: 1,
                       status: "ordered",
                       start_date: nil,
                       end_date: nil)
                     }
  let (:listing) {
    Listing.create(title: "C&C Music Factory",
                   description: "Jam",
                   nightly_rate: 10000,
                   category_id: 2,
                   max_guests: 10,
                   address1: "123 Elm St",
                   address2: "Apt 21",
                   city: "Denver",
                   state: "CO",
                   zip: 80022,
                   shared_bathroom: true,
                   user_id: 1
                   ) }
  # reservation.reservation_listings.create(item_id: item1.id, quantity: 1)
  #   listing.categories << @category
  #   listing.save
  #   listing
  #   category = Category.create(name: "NewCategory")
  # let(:user) do
  #   User.create(first_name: "Bryce",
  #               last_name: "Holcomb",
  #               display_name: "valid",
  #               about_me: "valid",
  #               email: "bryce@gmail.com",
  #               password: "password",
  #               slug: "Bryce")

  it "is valid" do
    expect(reservation).to be_valid
  end

  it "can have listings" do
    expect(reservation.listings).to eq([])
  end

  xit "defaults to ordered" do
    reservation.items << item
    expect(reservation.status).to eq("ordered")
  end

  context "must have" do
    xit "a user to be valid" do
      reservation.user_id = nil
      reservation.items << item
      expect(reservation.save).to eq false
    end
  end

  xit "belongs to a user" do
    reservation.items << item
    reservation.save
    expect(reservation).to be_valid
    expect(user.reservations.first).to eq(reservation)
  end

  xit "can have formatted reservation numbers" do
    reservation = Reservation.create(user_id: 1)
    expect(reservation.format_reservation_number(reservation.id)).to eq("00001")
  end
end
