require "rails_helper"

RSpec.describe Cart, type: :model do
  xit "has data" do
    cart = Cart.new("1" => 3)
    expect(cart.data).to eq("1" => 3)
  end

  xit "is displays 0 when no data is given" do
    cart = Cart.new(nil)
    expect(cart.data).to eq({})
  end

  xit "can have an listing added" do
    cart = Cart.new(nil)
    cart.add_listing("1")
    expect(cart.data).to eq("1" => 1)
  end

  xit "can count listings" do
    cart = Cart.new(nil)
    cart.add_listing("1")
    cart.add_listing("1")
    expect(cart.count(cart.data)).to eq(2)
  end

  xit "can have an listing removed" do
    cart = Cart.new(nil)
    cart.add_listing("1")
    cart.add_listing("1")
    cart.remove_listing("1")
    expect(cart.data).to eq("1" => 1)
  end

  xit "removes the listing when quantity is zero" do
    cart = Cart.new(nil)
    cart.add_listing("1")
    cart.remove_listing("1")
    expect(cart.data).to eq({})
  end
end
