require "rails_helper"

RSpec.describe Reservation, type: :model do
  let (:reservation) do
    Reservation.new(user_id: 1,
                    start_date: Date.new,
                    end_date: Date.new)
  end

  let (:listing) do
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
                   user_id: 1)
  end

  let(:user) do
    User.create(first_name: "Bryce",
                last_name: "Holcomb",
                display_name: "valid",
                about_me: "valid",
                email: "bryce@gmail.com",
                password: "password")
  end

  it "is valid" do
    expect(reservation).to be_valid
  end

  it "can have listings" do
    expect(reservation.listings).to eq([])
  end

  it "status defaults to pending" do
    expect(reservation.status).to eq("pending")
  end

  context "must have" do
    it "a user to be valid" do
      reservation.user_id = nil
      expect(reservation.save).to eq false
    end
  end

  it "belongs to a user" do
    user.reservations.create(start_date: Date.new,
                             end_date: Date.new)
    expect(user.reservations.first).to eq(Reservation.first)
  end

  xit "can have formatted reservation numbers" do
    reservation = Reservation.create(user_id: 1)
    expect(reservation.format_reservation_number(reservation.id)).to eq("00001")
  end
end
