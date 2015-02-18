require "rails_helper"

RSpec.describe Category, type: :model do
  let!(:category) { Category.create(name: "NewCategory")}

  it "can have listings" do
    expect(category.listings).to eq([])
  end

  it "has a listing" do
    listing = Listing.create(title: "NewTitle",
                          description: "new description",
                          nightly_rate: 200,
                          max_guests: 2,
                          category_id: category.id,
                          address1: "2424 Wilshire BLVD.",
                          address2: "apt 23",
                          city: "Los Angeles",
                          state: "CA",
                          zip: 91296,
                          shared_bathroom: true,
                          user_id: 1)
    #listing.category_id = category.id
    #listing.save
    expect(category.listings).to eq([listing])
  end
end
