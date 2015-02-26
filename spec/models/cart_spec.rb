require "rails_helper"

RSpec.describe Cart, type: :model do
  it "has data" do
    cart = Cart.new("1" => 3)
    expect(cart.data).to eq("1" => 3)
  end
end
