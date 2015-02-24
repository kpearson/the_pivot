require "rails_helper"

describe "user creates a listing", type: :feature do
  before(:each) do
    visit root_path
  end

  it "and is redirected to the new created listing" do
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
    expect(page).to have_content("New Listing")
    expect(page).to have_button("Book It!")
  end
end
