require "rails_helper"

describe "a host" do
  include Capybara::DSL

  let!(:user) do
    User.create(first_name: "John",
                display_name: "john",
                last_name: "Doe",
                about_me: "valid",
                email: "john@gmail.com",
                password: "password",
                role: 0)
  end

  let!(:host_user) do
    User.create(first_name: "Jane",
                last_name: "Doe",
                display_name: "jane",
                about_me: "valid",
                email: "jane@gmail.com",
                password: "password",
                role: 1)
  end

  it "after creating a listing a user becomes a host" do

    valid_user = create(:user)
    create(:category, name: "Condo")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(valid_user)
    visit new_user_listing_path(valid_user.slug)
    fill_in "listing[title]", with: "New Listing"
    fill_in "listing[description]", with: "New Listing description"
    fill_in "listing[nightly_rate]", with: "100"
    fill_in "listing[max_guests]", with: "2"
    choose "Condo"
    check ("listing[shared_bathroom]")
    fill_in "listing[address1]", with: "2424 W. Olive Ave."
    fill_in "listing[address2]", with: "apt 2"
    fill_in "listing[city]", with: "Chicago"
    fill_in "listing[state]", with: "MI"
    fill_in "listing[zip]", with: "43601"
    click_link_or_button("Create Listing")
    expect(valid_user.role).to eq("host")
    expect(valid_user.host?).to eq(true)
  end

  it "can view its host dashboard" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button("Dashboard")
    expect(page).to have_content("Jane's Dashboard")
  end

  it "can visit its host dashboard and see their dashboard links" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button("Dashboard")
    expect(page).to have_content("Edit Your Listings")
    expect(page).to have_content("Manage Reservations")
    expect(page).to have_content("Reservation Requests")
  end

  it "can view their listings as links to the edit page" do
    valid_user = create(:user, role: 1)
    listing = create(:listing)
    create(:category, name: "Condo")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(valid_user)
      visit root_path
      click_link_or_button("Dashboard")
      expect(page).to have_content("New Listing")

      click_link_or_button("New Listing")
      expect(page).to have_content("Edit listing")
    fill_in "listing[title]", with: "Edited Listing"
    fill_in "listing[description]", with: "edited Listing description"
    click_link_or_button("Update Listing")
    expect(page).to have_content("Edited Listing")
    expect(page).to have_link("Book It!")
  end
end
