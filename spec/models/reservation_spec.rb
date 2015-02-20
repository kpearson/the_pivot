require "rails_helper"

RSpec.describe Reservation, type: :model do
  let(:user) do
    User.create(first_name: "Bryce",
                last_name: "Holcomb",
                display_name: "valid",
                about_me: "valid",
                email: "bryce@gmail.com",
                password: "password")
  let(:reservation) { Reservation.new(user_id: user.id) }
  let!(:item) do
    @category = Category.create(name: "NewCategory")
    listing = Listing.new(title: "C&C Music Factory",
                          description: "Jam",
                          category_id: 2,
                          max_guests: 10,
                          nightly_rate: 10000,
                          address1: "123 Elm St",
                          address2: "Apt 21",
                          city: "Denver",
                          state: "CO",
                          zip: 80022,
                          shared_bathroom: true,
                          user_id: 1)
    listing.categories << @category
    listing.save
    listing
  end
  end

  it "is valid" do
    reservation.listings << listing
    expect(reservation).to be_valid
  end

  xit "can have items" do
    reservation.items << item
    expect(reservation.items.first).to eq(item)
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
