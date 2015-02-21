require "rails_helper"

describe "an authenticated user" do
  include Capybara::DSL

  let!(:category1) { Category.create(name: "Condo") }
  let!(:category2) { Category.create(name: "House") }
  let!(:listing) do
    Listing.create(title: "B&B",
                   description: "Super classy",
                   category_id: 1,
                   max_guests: 2,
                   nightly_rate: 10000,
                   address1: "123 Elm St",
                   address2: nil,
                   city: "Denver",
                   state: "CO",
                   zip: 80022,
                   shared_bathroom: false,
                   user_id: 1)
  end
  let!(:valid_user) do
    User.create(first_name: "Alice",
                last_name: "Smith",
                display_name: "valid",
                about_me: "valid",
                email: "alice@gmail.com",
                password: "password")
  end

  before(:each) do
    visit root_path
  end

  it "can browse all listings (listings index page)" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    # click_link_or_button "View all properties"
    visit(listings_path)
    expect(page).to have_content listing.description
    expect(page).to have_content "$100.00"
  end

  xit "can browse a listing by clicking the listing's title" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit listings_path
    click_link_or_button "B&B"
    expect(current_path).to eq(user_listing_path(listing.user.slug, listing))
    within("div.listing") do
      expect(page).to have_content listing.title
      expect(page).to have_content listing.description
      expect(page).to have_content "$100.00"
    end
  end

  xit "can add an item to a cart" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
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
    visit new_reservation_path
    within("#item_1") do
      click_link "Remove From Cart"
    end
    within("#cart-contents") do
      expect(page).to have_content("0")
    end
    expect(current_path).to eq(new_reservation_path)
    expect(page).to_not have_content("Bacon")
  end

  it "can view their own page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit user_path(valid_user)
    expect(current_path).to eq(user_path(valid_user))
  end

  xit "cannot edit another user's profile" do
  end

  it "cannot view admin dashboard" do
    admin = Admin.create(first_name: "First",
                         last_name: "Last",
                         email: "admin@gmail.com",
                         password: "adminpassword")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit admin_path(admin)
    expect(current_path).to eq(not_found_path)
  end

  xit "can log in and out without clearing the cart" do
    within("#cart-contents") do
      expect(page).to have_content("0")
    end
    click_add_to_cart_link("Breakfast")
    valid_user_logs_in
    within("#cart-contents") do
      expect(page).to have_content("1")
    end
    click_add_to_cart_link("Breakfast")
    click_link_or_button "Log Out"
    within("#flash_notice") do
      expect(page).to have_content("Successfully Logged Out")
    end
    within("#cart-contents") do
      expect(page).to have_content("2")
    end
  end

  xit "checkout" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    click_add_to_cart_link("Breakfast")
    click_link_or_button "Cart:"
    click_link_or_button "Checkout"
    within("#flash_notice") do
      expect(page).to have_content("Your delicious food is on the way")
    end
  end

  xit "can view their reservation after checkout" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    click_add_to_cart_link("Breakfast")
    click_link_or_button "Cart:"
    click_link_or_button "Checkout"
    within("#item-title") do
      expect(page).to have_content("Bacon")
    end
    within("#item-description") do
      expect(page).to have_content("The classic breakfast dish")
    end
    within("#item-quantity") do
      expect(page).to have_content("1")
    end
    within("#item-price") do
      expect(page).to have_content("$10.00")
    end
    within("#item-subtotal") do
      expect(page).to have_content("$10.00")
    end
    within("#item-total") do
      expect(page).to have_content("$10.00")
    end
    within("#reservation-status") do
      expect(page).to have_content("ordered")
    end
  end

  xit "can view past trips with links to each trip" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    Reservation.create(user_id: valid_user.id)
    Reservation.create(user_id: valid_user.id)
    visit user_path(valid_user.id)
    click_link_or_button "Cart:"
    expect(current_path).to eq(reservations_path)
    within(".reservations-list") do
      expect(page).to have_content("Reservation 00001")
    end
  end

  xit "can view particular trips (trip show page)" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    Reservation.create(user_id: valid_user.id)
    visit user_path(valid_user.id)
    click_link_or_button "Cart"
    click_link_or_button "Reservation 00001"
    expect(page).to have_content("Reservation 00001")
  end
  #
  # it "can edit their profile on their own page" do
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).
  #                                                   and_return(valid_user)
  #   visit user_path(valid_user)
  #   expect(current_path).to eq(user_path(valid_user))
  #   click_link_or_button('Edit Profile')
  #   fill_in "user[about_me]", with: "I'm no fun!"
  #   click_link_or_button 'Submit'
  #   expect(page).to have_content("I'm no fun!")
  # end
  #
  # context "can view the reservation page with" do
  #   before(:each) do
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).
  #     and_return(valid_user)
  #     click_add_to_cart_link("Breakfast")
  #     click_link_or_button "Cart:"
  #     click_link_or_button "Checkout"
  #   end
  #
  #   it "items with quantity ordered and line-item subtotals" do
  #     within("#item-quantity") do
  #       expect(page).to have_content("1")
  #     end
  #     within("#item-subtotal") do
  #       expect(page).to have_content("$10.00")
  #     end
  #   end
  #
  #   it "items with links to each item description page" do
  #     within("#item-title") do
  #       click_link_or_button "Bacon"
  #     end
  #     expect(page).to have_content("Bacon")
  #   end
  #
  #   it "the current status of the reservation" do
  #     within("#reservation-status") do
  #       expect(page).to have_content("ordered")
  #     end
  #   end
  #
  #   it "reservation total price" do
  #     within("#item-total") do
  #       expect(page).to have_content("$10.00")
  #     end
  #   end
  #
  #   xit "date/time reservation was submitted" do
  #     within("#reservation-submit-time") do
  #       expect(page).to have_content("Reservation Submitted At:")
  #     end
  #   end
  # end

  # context ", when an item is retired," do
  #   before(:each) do
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).
  #                                                     and_return(valid_user)
  #     click_add_to_cart_link("Breakfast")
  #     item = Item.find_by(title: "Bacon and Eggs")
  #     item.update(status: "hidden")
  #     click_link_or_button "Cart:"
  #     click_link_or_button "Checkout"
  #   end
  #
  #   xit "can still access the item page" do
  #     click_link_or_button "Bacon and Eggs"
  #     expect(current_path).to eq(item_path(1))
  #     expect(page).to have_content("Bacon and Eggs")
  #   end
  # end

  it "cannot see the login button" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit root_path
    expect(page).to_not have_content("Log In")
  end

  xit "cannot modify an item" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit edit_admin_item_path(1)
    expect(page).to have_content("Page Not Found")
  end

  xit "cannot assign an item to a category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit edit_admin_category_path(category1)
    expect(page).to have_content("Page Not Found")
    visit categories_path
    expect(page).to_not have_content("Add to Category")
  end

  xit "cannot remove an item from a category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit new_admin_category_path
    expect(page).to have_content("Page Not Found")
    visit categories_path
    expect(page).to_not have_content("Remove from Category")
  end

  it "cannot create a category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit new_admin_category_path
    expect(page).to have_content("Page Not Found")
  end

  it "cannot modify a category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit edit_admin_category_path(category1)
    expect(page).to have_content("Page Not Found")
  end

  it "cannot make themselves an admin" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit new_admin_path
    expect(page).to have_content("Page Not Found")
  end
  #
  # def click_add_to_cart_link(category)
  #   click_link_or_button "Menu"
  #   within(".categories") do
  #     within("div##{category}") do
  #         click_link "Add to Cart"
  #     end
  #   end
  # end
  #
  def valid_user_logs_in
    click_link "Log In"
    fill_in "session_email", with: "alice@gmail.com"
    fill_in "session_password", with: "password"
    click_button "Log In"
  end
end
