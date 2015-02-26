require "rails_helper"

describe "authenticated" do
  include Capybara::DSL

  let!(:user) do
    User.create(first_name: "Bryce",
                last_name: "Holcomb",
                display_name: "valid",
                about_me: "valid",
                email: "bryce@gmail.com",
                password: "userpassword")
  end

  let!(:admin) do
    Admin.create(first_name: "Rich",
                 last_name: "Shea",
                 email: "rich@gmail.com",
                 password: "adminpassword")
  end

  context "user" do
    it "can add them self to the system", js: true do
      visit root_path
      click_link("Sign Up")
      expect(current_path).to eq(root_path)
      expect(page).to have_css("#signup-modal")

      fill_in "user[first_name]", with: "Joe"
      fill_in "user[last_name]", with: "Doe"
      fill_in "user[email]", with: "Joe@example.com"
      fill_in "user[display_name]", with: "anothername"
      fill_in "user[about_me]", with: "desc"
      fill_in "user[password]", with: "password"
      click_button("Sign Up")
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Profile")
    end

    it "can log in if registered" do
      log_in(user, "userpassword")
      expect(current_path).to eq(root_path)
      within("#flash_notice") do
        expect(page).to have_content("Successfully Logged In")
      end
    end

    it "can not login with invalid credentials" do
      log_in(user, "incorect_password")
      expect(current_path).to eq(root_path)
      within("#flash_error") do
        expect(page).to have_content("Invalid Login Credentials")
      end
    end

    it "can log out" do
      log_in(user, "userpassword")
      expect(current_path).to eq(root_path)
      within("#flash_notice") do
        expect(page).to have_content("Successfully Logged In")
      end
      click_link_or_button "Log Out"
      expect(current_path).to eq(root_path)
      within("#flash_notice") do
        expect(page).to have_content("Successfully Logged Out")
      end
    end
  end

  def log_in(user_type, password)
    visit root_path
    click_link "Log In"
    expect(current_path).to eq(root_path)
    expect(page).to have_css("#login-modal")

    fill_in "session[email]", with: user_type.email
    fill_in "session[password]", with: password
    click_button "Log In"
  end
end
