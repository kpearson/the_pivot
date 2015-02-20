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

  xit "after creating a listing a user becomes a host" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                 and_return(host_user)
    expect(user.role).to eq("default")
    visit root_path
    click_link "Create A Listing"
    fill_in "listing[title]", with: "Sexy Beach House"
    fill_in "listing[description]", with: "Description"
    fill_in "listing[nightly_rate]", with: "10000"
    choose("House")
    fill_in "listing[max_guests]", with: "10"
    check(:shared_bathroom)
    fill_in "listing[address1]", with: "10 Blake st."
    fill_in "listing[address2]", with: "10 Blake st."
    fill_in "listing[city]", with: "Denver"
    fill_in "listing[state]", with: "CO"
    fill_in "listing[zip]", with: "80205"
    click_link_or_button('Create Listing')
    expect(user.role).to eq("host")
    expect(user.host?).to eq(true)
  end
end
