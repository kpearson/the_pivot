require 'rails_helper'

RSpec.describe Listing, type: :model do
  let!(:valid_listing) do
    Listing.new(title: "B&B",
                description: "Super classy",
                category_id: 1,
                max_guests: 2,
                nightly_rate: 10000,
                address1: "123 Elm St",
                address2: "",
                city: "Denver",
                state: "CO",
                zip: 80022,
                shared_bathroom: false,
                user_id: 1)
  end

  it "is valid" do
    expect(valid_listing).to be_valid
  end

  context "is not valid without" do
    it "title" do
      valid_listing.title = ""
      expect(valid_listing).to be_invalid
    end

    it "description" do
      valid_listing.description = ""
      expect(valid_listing).to be_invalid
    end

    it "category_id" do
      valid_listing.category_id = ""
      expect(valid_listing).to be_invalid
    end

    it "max_guests" do
      valid_listing.max_guests = ""
      expect(valid_listing).to be_invalid
    end

    it "nighty_rate" do
      valid_listing.nightly_rate = ""
      expect(valid_listing).to be_invalid
    end

    it "address1" do
      valid_listing.address1 = ""
      expect(valid_listing).to be_invalid
    end

    it "city" do
      valid_listing.city = ""
      expect(valid_listing).to be_invalid
    end

    it "state" do
      valid_listing.state = ""
      expect(valid_listing).to be_invalid
    end

    it "zip" do
      valid_listing.zip = ""
      expect(valid_listing).to be_invalid
    end

    it "shared_bathroom" do
      valid_listing.shared_bathroom = ""
      expect(valid_listing).to be_invalid
    end

    it "user_id" do
      valid_listing.user_id = ""
      expect(valid_listing).to be_invalid
    end

    it "unique title" do
      Listing.create(title: "B&B",
                     description: "Jam",
                     category_id: 2,
                     max_guests: 10,
                     nightly_rate: 10000,
                     address1: "123 Dog Ave",
                     address2: "",
                     city: "Denver",
                     state: "CO",
                     zip: 90222,
                     shared_bathroom: true,
                     user_id: 1)
      expect(valid_listing).to_not be_valid
    end

    it "a nightly rate greater than zero" do
      valid_listing.nightly_rate = -1
      expect(valid_listing).to_not be_valid
    end

    it "an integer nightly rate" do
      valid_listing.nightly_rate = "string"
      expect(valid_listing).to_not be_valid
    end
  end

  it "can belong to a user" do
    user = User.create(first_name: "Bryce",
                       last_name: "Holcomb",
                       display_name: "valid",
                       about_me: "valid",
                       email: "bryce@gmail.com",
                       password: "password")
    expect(valid_listing.user).to eq(user)
  end

  it "can belong to a category" do
    category = Category.create(name: "Home")
    expect(valid_listing.category).to eq(category)
  end

  xit "can have many reservations" do
    expect(valid_listing.reservations).to eq([])
  end

  xit "can have many photos" do
    expect(valid_listing.photos).to eq([])
  end

  it "has a currency that converts cents to dollars" do
    expect(valid_listing.currency).to eq(valid_listing.nightly_rate / 100)
  end

  it "has a full address" do
    expect(valid_listing.full_address).to eq("123 Elm St, Denver, CO 80022")
  end

  it "has a full address with address2" do
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
    expect(listing.full_address).to eq("123 Elm St, Apt 21, Denver, CO 80022")
  end
end
