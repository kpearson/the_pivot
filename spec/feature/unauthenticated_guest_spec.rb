require "rails_helper"

describe "As an unauthenticated user" do
  include Capybara::DSL

  let!(:category1) { Category.create(name: "House") }
  let!(:category2) { Category.create(name: "Room") }
  let!(:listing) do
    Listing.create(title: "B&B",
                   description: "Super classy",
                   category_id: 2,
                   max_guests: 2,
                   nightly_rate: 20000,
                   address1: "123 Elm St",
                   address2: nil,
                   city: "Denver",
                   state: "CO",
                   zip: 80022,
                   shared_bathroom: true,
                   user_id: 1)
  end

  before(:each) do
    visit root_path
  end

  xit "can login which does not clear cart" do
    click_add_to_cart_link("Breakfast")
    User.create(first_name: "Valid",
                last_name: "User",
                display_name: "valid",
                about_me: "valid",
                email: "valid@gmail.com",
                password: "secret")
    click_link "Log In"
    fill_in "session[email]", with: "valid@gmail.com"
    fill_in "session[password]", with: "secret"
    click_button "Log In"
    within("#flash_notice") do
      expect(page).to have_content("Successfully Logged In")
    end
    within("#cart-contents") do
      expect(page).to have_content("1")
    end
  end

  xit "can browse all listings (listings index page)" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    # click_link_or_button "View all properties"
    visit(listings_path)
    expect(page).to have_content listing.title
    expect(page).to have_content listing.description
    expect(page).to have_content "$200.00"
  end

  xit "can browse a listing by clicking the listing's title" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    visit listings_path
    click_link_or_button "B&B"
    expect(current_path).to eq(user_listing_path(listing.user.slug, listing))
    expect(page).to have_content(listing.title)
    within("div.listing") do
      expect(page).to have_content listing.title
      expect(page).to have_content listing.description
      expect(page).to have_content "$200.00"
      # expect(page).to have_content "John Doe"
    end
  end

  it "can view a listing page namespaced with the host's display name" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    visit user_listing_path(listing.user.slug, listing)
    expect(current_path).to eq("/joe/listings/1")
  end

  it "can filter listings page by City" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    new_listing = Listing.create(title: "House",
                                 description: "House in the rain",
                                 category_id: 1,
                                 max_guests: 4,
                                 nightly_rate: 10000,
                                 address1: "124 Elm St",
                                 address2: nil,
                                 city: "Seattle",
                                 state: "WA",
                                 zip: 98106,
                                 shared_bathroom: true,
                                 user_id: 1)
    visit listings_path
    fill_in("city", with: "Seattle")
    click_link_or_button "Filter"
    expect(page).to have_content(new_listing.description)
    expect(page).to_not have_content(listing.title)
  end


  it "can filter listings page by Category" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    Listing.create(title: "Rainy day house",
                   description: "house in the rain",
                   category_id: 1,
                   max_guests: 4,
                   nightly_rate: 20000,
                   address1: "124 Elm St",
                   address2: nil,
                   city: "Seattle",
                   state: "WA",
                   zip: 98106,
                   shared_bathroom: true,
                   user_id: 1)
    visit listings_path
    select("House", from: "_category_id")
    click_link_or_button "Filter"
    expect(page).to have_content("house in the rain")
    expect(page).not_to have_content("Super classy")
  end

  it "can filter listings page by Number of Guests" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    Listing.create(title: "Rainy day house",
                   description: "house in the rain",
                   category_id: 1,
                   max_guests: 4,
                   nightly_rate: 10000,
                   address1: "124 Elm St",
                   address2: nil,
                   city: "Seattle",
                   state: "WA",
                   zip: 98106,
                   shared_bathroom: true,
                   user_id: 1)
    visit listings_path
    select("3", from: "_max_guests")
    click_link_or_button "Filter"
    expect(page).to have_content("house in the rain")
    expect(page).not_to have_content("Super classy")
  end

  it "can filter listings page by Nightly Rate" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    Listing.create(title: "Rainy day house",
                   description: "house in the rain",
                   category_id: 1,
                   max_guests: 4,
                   nightly_rate: 10000,
                   address1: "124 Elm St",
                   address2: nil,
                   city: "Seattle",
                   state: "WA",
                   zip: 98106,
                   shared_bathroom: true,
                   user_id: 1)
    visit listings_path
    select("<$150", from: "_nightly_rate")
    click_link_or_button "Filter"
    expect(page).to have_content("house in the rain")
    expect(page).not_to have_content("Super classy")
  end

  it "can filter listings page by Nightly Rate, Max Guests,
  Category and City at the same time" do
    User.create(first_name: "John",
                last_name: "Doe",
                email: "joe@gmail.com",
                password: "password",
                about_me: "valid",
                id: 1,
                display_name: "joe")
    Listing.create(title: "Rainy day room",
                   description: "room in the rain",
                   category_id: 2,
                   max_guests: 2,
                   nightly_rate: 20000,
                   address1: "124 Elm St",
                   address2: nil,
                   city: "Seattle",
                   state: "WA",
                   zip: 98106,
                   shared_bathroom: true,
                   user_id: 1)
    Listing.create(title: "Toga Party!",
                   description: "Animal House",
                   category_id: 1,
                   max_guests: 2,
                   nightly_rate: 20000,
                   address1: "126 Elm St",
                   address2: nil,
                   city: "Denver",
                   state: "CO",
                   zip: 80222,
                   shared_bathroom: true,
                   user_id: 1)
    Listing.create(title: "Sigma Alpha Epsilon",
                   description: "Frat Room - Gotta be on the list bro.",
                   category_id: 2,
                   max_guests: 0,
                   nightly_rate: 20000,
                   address1: "125 Elm St",
                   address2: nil,
                   city: "Denver",
                   state: "CO",
                   zip: 80222,
                   shared_bathroom: true,
                   user_id: 1)
    Listing.create(title: "Room with a view",
                   description: "from space",
                   category_id: 2,
                   max_guests: 2,
                   nightly_rate: 50000,
                   address1: "125 Elm St",
                   address2: nil,
                   city: "Denver",
                   state: "CO",
                   zip: 80222,
                   shared_bathroom: true,
                   user_id: 1)
    visit listings_path
    fill_in("city", with: "Denver")
    select("Room", from: "_category_id")
    select("1", from: "_max_guests")
    select("<$300", from: "_nightly_rate")
    click_link_or_button "Filter"
    expect(page).to have_content("Super classy")
    expect(page).not_to have_content("Rainy day house")
    expect(page).not_to have_content("Animal House")
    expect(page).not_to have_content("Sigma Alpha Epsilon")
    expect(page).not_to have_content("from space")
  end

  xit "can add an item to a cart" do
    click_add_to_cart_link("Breakfast")
    within("#cart-contents") do
      expect(page).to have_content("1")
    end
  end

  xit "can add two items to a cart" do
    click_add_to_cart_link("Breakfast")
    click_add_to_cart_link("Breakfast")
    click_add_to_cart_link("Lunch")
    within("#cart-contents") do
      expect(page).to have_content("3")
    end
  end

  xit "can remove an item from a cart" do
    click_add_to_cart_link("Breakfast")
    visit new_order_path
    within("#item_1") do
      click_link "Remove From Cart"
    end
    within("#cart-contents") do
      expect(page).to have_content("0")
    end
    expect(current_path).to eq(new_order_path)
    expect(page).to_not have_content("Bacon")
  end

  it "cannot see the logout button" do
    expect(page).to_not have_content("Log Out")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(nil)
    visit root_path
    expect(page).to_not have_content("Log Out")
  end

  xit "can log out which does not clear cart" do
    click_add_to_cart_link("Breakfast")
    User.create(first_name: "Rich",
                last_name: "Shea",
                email: "bryce@gmail.com",
                password: "secret")
    click_link "Log In"
    fill_in "session[email]", with: "bryce@gmail.com"
    fill_in "session[password]", with: "secret"
    click_button "Log In"
    within("#cart-contents") do
      expect(page).to have_content("1")
    end
    click_link_or_button "Log Out"
    within("#flash_notice") do
      expect(page).to have_content("Successfully Logged Out")
    end
    within("#cart-contents") do
      expect(page).to have_content("1")
    end
  end

  xit "can view their empty cart" do
    click_link_or_button "Cart"
    expect(current_path).to eq(new_order_path)
    expect(page).to have_content("Your cart is empty")
  end

  xit "can view their cart with items" do
    click_add_to_cart_link("Breakfast")
    click_add_to_cart_link("Breakfast")
    click_link_or_button "Cart:"
    expect(current_path).to eq(new_order_path)
    expect(page).to have_content("Bacon")
    within "div#quantity" do
      expect(page).to have_content("2")
    end
    within "div#description" do
      expect(page).to have_content("The classic breakfast dish")
    end
    within "div#price" do
      expect(page).to have_content("$10.00")
    end
  end

  xit "cannot edit a user's profile" do
  end

  xit "cannot checkout" do
    click_add_to_cart_link("Breakfast")
    click_add_to_cart_link("Breakfast")
    click_link_or_button "Cart:"
    expect(current_path).to eq(new_order_path)
    click_link_or_button "Checkout"
    expect(current_path).to eq(new_order_path)
    within("#flash_notice") do
      expect(page).to have_content("Please login or signup to continue with checkout")
    end
  end

  it "cannot view the admin dashboard" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(nil)
    expect(page).to_not have_content("Admin Dashboard")
  end

  xit "cannot create an item" do
    visit new_admin_item_path
    expect(page).to have_content("Page Not Found")
  end

  xit "cannot modify an item" do
    visit edit_admin_item_path(item)
    expect(page).to have_content("Page Not Found")
  end

  xit "cannot assign an item to a category" do
    visit edit_admin_category_path(category1)
    expect(page).to have_content("Page Not Found")
    visit categories_path
    expect(page).to_not have_content("Add to Category")
  end

  xit "cannot remove an item from a category" do
    visit new_admin_category_path
    expect(page).to have_content("Page Not Found")
    visit categories_path
    expect(page).to_not have_content("Remove from Category")
  end

  xit "cannot create a category" do
    visit new_admin_category_path
    expect(page).to have_content("Page Not Found")
  end

  xit "cannot modify a category" do
    visit edit_admin_category_path(category1)
    expect(page).to have_content("Page Not Found")
  end

  xit "cannot make themselves an admin" do
    visit new_admin_path
    expect(page).to have_content("Page Not Found")
  end

  # def click_add_to_cart_link(category)
  #   click_link_or_button "Menu"
  #   within(".categories") do
  #     within("div##{category}") do
  #       within("div.item") do
  #         click_link "Add to Cart"
  #       end
  #     end
  #   end
  # end
end
