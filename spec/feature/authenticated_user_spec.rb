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

  let!(:user) do
    User.create(first_name: "John",
    last_name: "Doe",
    display_name: "john",
    about_me: "valid",
    email: "john@gmail.com",
    password: "password",
    role: 0)
  end

  before(:each) do
    visit root_path
  end

  it "cannot see a host's dashboard in their profile dropdown" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    visit root_path
    expect(page).to_not have_content("Dashboard")
  end

  it "can see a user profile dropdown" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    visit root_path
    expect(page).to have_content("Profile")
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("Trips")
  end


  it "can browse all listings (listings index page)" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    click_link_or_button "Destinations"
    visit(listings_path)
    expect(page).to have_content listing.description
    expect(page).to have_content "$100.00"
  end

  xit "can browse a listing by clicking the listing" do
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

  it "can add a listing to a cart", js: true do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    visit user_listing_path(valid_user.slug, listing)
    page.execute_script("$('#check_in').val('02/24/2015')")
    page.execute_script("$('#check_out').val('02/26/2015')")
    click_button('Book It!')
    expect(current_path).to eq(user_listing_path(valid_user.slug, listing))
    expect(page).to have_content('Listing Successfully Added To Reservations')
  end

  it "can visit the new reservation page and see pending listings" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(user)
    visit root_path
    click_link_or_button("Reservations")
    expect(current_path).to eq(new_reservation_path)
    expect(page).to have_content('Your Reservations')
  end

  it "can visit the new reservation page and see that is it empty" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(user)
    visit root_path
    click_link_or_button("Reservations")
    expect(current_path).to eq(new_reservation_path)
    expect(page).to have_content("Your Reservations Are Empty!")
  end

  it "can visit the new reservation page and request a listing", js: true do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)

    visit user_listing_path(valid_user.slug, listing)
    page.execute_script("$('#check_in').val('02/24/2015')")
    page.execute_script("$('#check_out').val('02/26/2015')")
    click_button('Book It!')
    expect(current_path).to eq(user_listing_path(valid_user.slug, listing))
    expect(page).to have_content('Listing Successfully Added To Reservations')

    visit root_path
    click_link_or_button("Reservations")
    expect(current_path).to eq(new_reservation_path)
    expect(page).to have_content("Your Reservations")
    click_button("Request Listing")
    expect(page).to have_content("Request Sent!")
    expect(current_path).to eq(new_reservation_path)
  end

  it "cannot see listing intheir cart after it has been requested", js: true do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)

    visit user_listing_path(valid_user.slug, listing)
    page.execute_script("$('#check_in').val('02/24/2015')")
    page.execute_script("$('#check_out').val('02/26/2015')")
    click_button('Book It!')
    expect(current_path).to eq(user_listing_path(valid_user.slug, listing))
    expect(page).to have_content('Listing Successfully Added To Reservations')

    visit root_path
    click_link_or_button("Reservations")
    expect(current_path).to eq(new_reservation_path)
    expect(page).to have_content("Your Reservations")
    click_button("Request Listing")
    expect(page).to have_content("Your Reservations Are Empty!")
  end

  it "can delete a reservation from the request cart", js: true do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)

    visit user_listing_path(valid_user.slug, listing)
    page.execute_script("$('#check_in').val('02/24/2015')")
    page.execute_script("$('#check_out').val('02/26/2015')")
    click_button('Book It!')
    expect(current_path).to eq(user_listing_path(valid_user.slug, listing))
    expect(page).to have_content('Listing Successfully Added To Reservations')

    visit root_path
    click_link_or_button("Reservations")
    expect(current_path).to eq(new_reservation_path)
    expect(page).to have_content("Your Reservations")
    click_button("Remove")
    expect(page).to have_content("Listing Removed")
    expect(current_path).to eq(new_reservation_path)
  end

  it "can view their own page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit user_path(valid_user.id)
    expect(current_path).to eq(user_path(valid_user.id))
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
  end

  xit "can view their reservation after checkout" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
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

  it "can edit their profile on their own page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                    and_return(valid_user)
    visit user_path(valid_user)
    click_link_or_button('Edit Profile')
    fill_in "user[about_me]", with: "I'm no fun!"
    click_link_or_button 'Submit'
    expect(page).to have_content("I'm no fun!")
  end

  it "cannot see the login button" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    visit root_path
    expect(page).to_not have_content("Log In")
  end

  xit "cannot modify a listing" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
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

  it "cannot view a hosts dashboard" do
    another_user = create(:user, email: "yes@yahoo.com", display_name: "harry")
    host = create(:user, role: 1, email: "no@yahoo.com", display_name: "sally" )
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(another_user)
    visit user_dashboard_path(host)
    expect(current_path).to eq(root_path)
  end

  def valid_user_logs_in
    click_link "Log In"
    fill_in "session_email", with: "alice@gmail.com"
    fill_in "session_password", with: "password"
    click_button "Log In"
  end
end
