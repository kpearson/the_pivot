require "rails_helper"

describe "a host" do
  include Capybara::DSL

  let!(:user) do
    Admin.create(first_name: "John",
                 last_name: "Doe",
                 email: "john@gmail.com",
                 password: "password",
                 role: 0)
  end

  let!(:host) do
    Admin.create(first_name: "Jane",
                 last_name: "Doe",
                 email: "jane@gmail.com",
                 password: "password",
                 role: 1)
  end

  it "after creating a listing a user becomes a host"
  allow_any_instance_of(ApplicationController).to receive(:current_user).
                                               and_return(:host)
      assert_equal 0, user.role
      visit root_path
      click_link_or_button "Create A Listing"
      fill_in "item[title]", with: "Sexy Beach House"
      fill_in "item[description]", with: "Description"
      fill_in "item[nightly_rate]", with: "10000"
      select('House', :from => 'category')
      fill_in "item[max_guests]", with: "10"
      check(:shared_bathroom)
      fill_in "item[address1]", with: "10 Blake st."
      fill_in "item[address2]", with: "10 Blake st."
      fill_in "item[city]", with: "Denver"
      fill_in "item[state]", with: "CO"
      fill_in "item[zip]", with: "80205"
      click_link_or_button('Create Listing')
      assert_equal 1,  user.role
    end
