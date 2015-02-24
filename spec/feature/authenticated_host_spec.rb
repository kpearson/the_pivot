require "rails_helper"

describe "a host" do
  include Capybara::DSL

  let!(:user) do
    User.create
  end

  it "has their role changed from user to host after creating a listing" do

    valid_user = create(:user, role: 1)
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
    host_user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button("Dashboard")
    expect(page).to have_content("Alice's Dashboard")
  end

  it "can visit its host dashboard and see their dashboard links" do
    host_user = create(:user, role: 1)
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
    expect(listing.user).to eq(valid_user)
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

  it " it cannot view another hosts dashboard" do
    valid_user = create(:user, role: 1)
    another_host = create(:user, email: "new@y.com", display_name: "username", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(another_host)
    visit user_dashboard_path(valid_user)
    expect(current_path).to eq(root_path)
  end

  it "can delete their listing on their edit page" do
    valid_user = create(:user, role: 1)
    listing = create(:listing)
    create(:category, name: "Condo")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(listing.user)
    visit root_path
    click_link_or_button("Dashboard")
    expect(page).to have_content("New Listing")
    click_link_or_button("New Listing")
    expect(page).to have_content("Edit listing")
    click_link_or_button("Delete This Listing")
    visit user_dashboard_path(valid_user.slug)
    expect(page).to_not have_content("New Listing")
  end
end
