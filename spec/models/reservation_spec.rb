require "rails_helper"

RSpec.describe Reservation, type: :model do
  let!(:reservation) do
    Reservation.new(user_id: 1,
                    listing_id: 1,
                    start_date: Date.new,
                    end_date: Date.new)
  end

  let!(:listing) do
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

  let!(:user) do
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

  it "belongs to a listing" do
    expect(reservation.listing).to eq(listing)
  end

  it "status defaults to pending" do
    expect(reservation.status).to eq("pending")
  end

  context "must have" do
    it "a user to be valid" do
      reservation.user_id = nil
      expect(reservation.save).to eq false
    end

    it "a start date to be valid" do
      reservation.start_date = nil
      expect(reservation.save).to eq false
    end

    it "an end date to be valid" do
      reservation.end_date = nil
      expect(reservation.save).to eq false
    end

    it "a listing to be valid" do
      reservation.listing_id = nil
      expect(reservation.save).to eq false
    end
  end

  it "belongs to a user" do
    user.reservations.create(start_date: Date.new,
                             listing_id: 1,
                             end_date: Date.new)
    expect(user.reservations.first).to eq(Reservation.first)
  end

  it "has cancelled reservations" do
    reservation.status = "cancelled"
    reservation.save
    expect(Reservation.cancelled.first).to eq(reservation)
  end

  it "has pending reservations" do
    reservation.save
    expect(Reservation.pending.first).to eq(reservation)
  end

  it "has approved reservation" do
    reservation.status = "approved"
    reservation.save
    expect(Reservation.approved.first).to eq(reservation)
  end

  it "has past reservation" do
    reservation.status = "past"
    reservation.save
    expect(Reservation.past.first).to eq(reservation)
  end
end
