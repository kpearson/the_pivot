require "rails_helper"

describe 'user edits a listing', type: :feature do
  before(:each) do
    visit root_path
  end

  it "sees the listing edit fields" do
    valid_user = create(:user)
    listing = create(:listing)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(valid_user)
    visit edit_user_listing_path(valid_user.slug, listing.id)
    expect(page).to have_content("Edit listing")
  end

  xit "and is redirected to the edited listing and sees the edits" do
    valid_user = create(:user)
    listing = create(:listing)
    create(:category, name: "Condo")
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(valid_user)
    visit edit_user_listing_path(valid_user.slug, listing.id)
    fill_in "listing[title]", with: "Edited Listing"
    fill_in "listing[description]", with: "edited Listing description"
    click_link_or_button("Update Listing")
    expect(page).to have_content("Edited Listing")
    expect(page).to have_link("Book It!")
  end
end
