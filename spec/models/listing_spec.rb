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

    xit "unique title" do
      listing = Listing.create(title: "NewTitle",
      description: "new description",
      price: 1000)
      listing.categories << @category
      item2 = Listing.new(title: "NewTitle",
      description: "newer description",
      price: 1000)
      expect(item2).to_not be_valid
    end

    xit "a grater than zero" do
      listing = Listing.create(title: "listing",
      description: "listing description",
      price: 0)
      listing.categories << @category
      expect(listing.save).to eq false
    end

    xit "an integer price" do
      listing = Listing.create(title: "another listing",
      description: "listing description",
      price: "werwsd")
      listing.categories << @category
      expect(listing.save).to eq false
    end

    xit "a status" do
      listing = Listing.create(title: "another listing",
      description: "listing description",
      status: nil,
      price: 1000)
      listing.categories << @category
      expect(listing.save).to eq false
    end

    xit "a category" do
      listing = Listing.create(title: "another listing",
      description: "listing description",
      price: 1000)
      # listing.categories << @category
      expect(listing.save).to eq false
    end
  end

  xit "can not have it last category removed" do
    expect(valid_item.categories.count).to eq 2
    valid_item.categories.delete @category
    expect(valid_item.categories.count).to eq 1
    valid_item.categories.delete @category
    expect(valid_item.categories.count).to eq 1
  end

  xit "can have hidden listings" do
    valid_item.status = "hidden"
    valid_item.save
    expect(Listing.hidden.count).to eq(1)
  end

  xit "can belong to an order" do
    listing = Listing.new
    expect(listing.orders).to eq([])
  end

  xit "has an order" do
    order = Order.new(user_id: 1)
    order.listings << valid_item
    order.save
    expect(order.listings.first).to eq(valid_item)
  end

  xit "shows the correct count with database cleaner" do
    Listing.create(title: "next listing",
    description: "desc",
    price: 2000)
    expect(Listing.count).to eq(1)
  end

  xit "has a currency that converts cents to dollars" do
    listing = Listing.create(title: "next listing",
    description: "desc",
    price: 2000)
    expect(listing.currency).to eq(20)
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
