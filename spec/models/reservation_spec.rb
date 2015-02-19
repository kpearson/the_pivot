require "rails_helper"

RSpec.describe Reservation, type: :model do
  let(:user) do
    User.create(first_name: "Alex",
                last_name: "Robinson",
                email: "alex@robinson.com",
                password: "password")
  end
  let(:reservation) { Reservation.new(user_id: user.id) }
  let!(:item) do
    @category = Category.create(name: "NewCategory")
    item = Item.new(title: "title",
                    description: "desc",
                    price: 2000,)
    item.categories << @category
    item.save
    item
  end

  xit "is valid" do
    reservation.items << item
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
