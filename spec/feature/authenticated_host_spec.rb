require "rails_helper"

describe "a host" do
  include Capybara::DSL

  let!(:user) do
    User.create(first_name: "John",
                last_name: "Doe",
                display_name: "john",
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

  let!(:listing) do
    Listing.create(title: "Another Listing",
                   description: "A Great Place",
                   nightly_rate: 1900,
                   category_id: 1,
                   max_guests: 12,
                   address1: "1500 Blake st",
                   city: "Denver",
                   state: "CO",
                   zip: 80211,
                   shared_bathroom: true,
                   user_id: 2)
  end

  it "has their role changed from user to host after creating a listing" do
    valid_user = create(:user, role: 1)
    create(:category, name: "Condo")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(valid_user)
    visit new_user_listing_path(valid_user.slug)
    fill_in "listing[title]", with: "Yet Another Listing"
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
    factory_host_user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(factory_host_user)
    visit root_path
    click_link_or_button("Dashboard")
    expect(page).to have_content("Edit Your Listings")
    expect(page).to have_content("Manage Reservations")
    expect(page).to have_content("Reservation Requests")
  end

  it "can view their listings as links to the edit page" do
    valid_user = create(:user, role: 1)
    listing = create(:listing, user_id: 3)
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
    expect(page).to have_button("Book It!")
  end

  it "can view their manange reservations page" do
    listing.reservations.create(user_id: 1,
                                start_date: Date.new,
                                end_date: Date.new)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button "Dashboard"
    click_link_or_button "Manage"
    expect(current_path).to eq(host_reservations_path(host_user.slug))
    expect(page).to have_content("John Doe")
    expect(page).to have_content("Another Listing")
    expect(page).to have_content("pending")
  end

  it "can view their pending reservations" do
    listing.reservations.create(user_id: 1,
                                start_date: Date.new,
                                end_date: Date.new)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button "Dashboard"
    click_link_or_button "My Requests"
    expect(current_path).to eq(host_reservations_path(host_user.slug))
    expect(page).to have_content("John Doe")
    expect(page).to have_content("Another Listing")
    expect(page).to have_content("pending")
  end

  it "can approve a request" do
    listing.reservations.create(user_id: 1,
                                start_date: Date.new,
                                end_date: Date.new)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button "Dashboard"
    click_link_or_button "My Requests"
    expect(current_path).to eq(host_reservations_path(host_user.slug))
    click_link_or_button "Approve"
    expect(page).to have_content("Reservation successfully changed to approved")
    expect(page).to_not have_content("pending")
    within("table") do
      expect(page).to have_content("approved")
    end
  end

  it "can decline a request" do
    listing.reservations.create(user_id: 1,
                                start_date: Date.new,
                                end_date: Date.new)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit root_path
    click_link_or_button "Dashboard"
    click_link_or_button "My Requests"
    expect(current_path).to eq(host_reservations_path(host_user.slug))
    click_link_or_button "Decline"
    expect(page).to have_content("Reservation successfully changed to cancelled")
    expect(page).to_not have_content("pending")
    within("table") do
      expect(page).to have_content("cancelled")
    end
  end

  it "can cancel a reservation" do
    listing.reservations.create(user_id: 1,
                                start_date: Date.new,
                                end_date: Date.new,
                                status: "approved")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit host_reservations_path(host_user.slug)
    click_link_or_button "Cancel"
    expect(current_path).to eq(user_reservations_path(host_user.slug))
    expect(page).to have_content("Reservation successfully changed to cancelled")
    expect(page).to_not have_content("approved")
    within("table") do
      expect(page).to have_content("cancelled")
    end
  end

  it "can restore a cancelled reservation" do
    listing.reservations.create(user_id: 1,
                                start_date: Date.new,
                                end_date: Date.new,
                                status: "cancelled")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(host_user)
    visit host_reservations_path(host_user.slug)
    click_link_or_button "Restore"
    expect(current_path).to eq(user_reservations_path(host_user.slug))
    expect(page).to have_content("Reservation successfully changed to pending")
    expect(page).to_not have_content("cancelled")
    within("table") do
      expect(page).to have_content("pending")
    end
  end

  it "it cannot view another hosts dashboard" do
    valid_user = create(:user, role: 1)
    another_host = create(:user, email: "new@y.com", display_name: "username", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(another_host)
    visit user_dashboard_path(valid_user)
    expect(current_path).to eq(root_path)
  end

  it "can see their listings on their show page" do
    create(:category, name: "Condo", id: 1)
    visit user_path(host_user.id)
    expect(page).to have_content("Listings")
    expect(page).to have_content("ANOTHER LISTING")
  end

  it "can delete their listing on their edit page" do
    valid_user = create(:user, role: 1)
    listing = create(:listing, user_id: 3)
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
