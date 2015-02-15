require 'rails_helper'

RSpec.describe Listing, :type => :model do
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
      listing = Listing.new(title: nil,
                            description: "Super classy",
                            category_id: 1,
                            max_guests: 2,
                            nightly_rate: 10000,
                            address1: "123 Elm St",
                            address2: "j",
                            city: "Denver",
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "description" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: nil,
                            category_id: 1,
                            max_guests: 2,
                            nightly_rate: 10000,
                            address1: "123 Elm St",
                            address2: "4",
                            city: "Denver",
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "category_id" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: nil,
                            max_guests: 2,
                            nightly_rate: 10000,
                            address1: "123 Elm St",
                            address2: "apt 21",
                            city: "Denver",
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "max_guests" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: nil,
                            nightly_rate: 10000,
                            address1: "123 Elm St",
                            address2: nil,
                            city: "Denver",
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "nighty_rate" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: 10,
                            nightly_rate: nil,
                            address1: "123 Elm St",
                            address2: nil,
                            city: "Denver",
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "address1" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: 10,
                            nightly_rate: 10000,
                            address1: nil,
                            address2: "",
                            city: "Denver",
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "city" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: 10,
                            nightly_rate: 10000,
                            address1: "123 Flower Power",
                            address2: "",
                            city: nil,
                            state: "CO",
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "state" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: 10,
                            nightly_rate: 10000,
                            address1: "123 Dog Ave",
                            address2: "",
                            city: "Denver",
                            state: nil,
                            zip: 80022,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "zip" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: 10,
                            nightly_rate: 10000,
                            address1: "123 Dog Ave",
                            address2: "",
                            city: "Denver",
                            state: "CO",
                            zip: nil,
                            shared_bathroom: true,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "shared_bathroom" do
      listing = Listing.new(title: "C&C Music Factory",
                            description: "Jam",
                            category_id: 2,
                            max_guests: 10,
                            nightly_rate: 10000,
                            address1: "123 Dog Ave",
                            address2: "",
                            city: "Denver",
                            state: "CO",
                            zip: 90222,
                            shared_bathroom: nil,
                            user_id: 1)
      expect(listing).to be_invalid
    end

    it "user_id" do
      listing = Listing.new(title: "C&C Music Factory",
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
                            user_id: nil)
      expect(listing).to be_invalid
    end

    it "unique title" do
      listing = Listing.create(title: "C&C Music Factory",
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
      listing2 = Listing.new(title: "C&C Music Factory",
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
      expect(listing2).to_not be_valid
    end

    it "a nightly rate greater than zero" do
      listing = Listing.create(title: "C&C Music Factory",
                               description: "Jam",
                               category_id: 2,
                               max_guests: 10,
                               nightly_rate: -1,
                               address1: "123 Dog Ave",
                               address2: "",
                               city: "Denver",
                               state: "CO",
                               zip: 90222,
                               shared_bathroom: true,
                               user_id: 1)
      expect(listing).to_not be_valid
    end

    it "an integer nightly rate" do
      listing = Listing.create(title: "C&C Music Factory",
                               description: "Jam",
                               category_id: 2,
                               max_guests: 10,
                               nightly_rate: "string",
                               address1: "123 Dog Ave",
                               address2: "",
                               city: "Denver",
                               state: "CO",
                               zip: 90222,
                               shared_bathroom: true,
                               user_id: 1)
      expect(listing).to_not be_valid
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
    listing = Listing.new(title: "C&C Music Factory",
                          description: "Jam",
                          category_id: 2,
                          max_guests: 10,
                          nightly_rate: 10000,
                          address1: "123 Elm St",
                          address2: nil,
                          city: "Denver",
                          state: "CO",
                          zip: 80022,
                          shared_bathroom: true,
                          user_id: 1)
    expect(listing.full_address).to eq("123 Elm St, Denver, CO 80022")
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
