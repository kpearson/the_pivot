require "rails_helper"

describe "an admin" do
  include Capybara::DSL

  let!(:admin) do
    Admin.create(first_name: "Bryce",
                 last_name: "Holcomb",
                 email: "bryce@gmail.com",
                 password: "password")
  end

  let!(:admin2) do
    Admin.create(first_name: "Rich",
                 last_name: "Shea",
                 email: "rich@gmail.com",
                 password: "adminpassword")
  end

  xit "can create a new admin" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                 and_return(admin)
    visit root_path
    click_link_or_button "New Admin"
    fill_in "admin_first_name", with: "Kit"
    fill_in "admin_last_name", with: "Pearson"
    fill_in "admin_email", with: "kit@kit.com"
    fill_in "admin_password", with: "password"
    click_link_or_button "Sign Up"
    within("#flash_notice") do
      expect(page).to have_content "Admin created successfully."
    end
  end

  xit "can not view other admins profile" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                 and_return(admin)
    visit(admin_path(admin2))
    expect(current_path).to eq(not_found_path)
  end

  xit "retire a listing which removes it from users' view" do
  end

  xit "can reveal a previously hidden listing" do
  end

  context "can view a dashboard with" do

    xit "the total number of reservations by status" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                           and_return(admin)
      create_user_reservations_with_items
      visit root_path
      click_link_or_button "View All Reservations"
      expect(page).to have_content("All Reservations")
      expect(page).to have_content("Completed: 2")
      expect(page).to have_content("Ordered: 1")
      expect(page).to have_content("Paid: 0")
    end

    xit "links for each individual reservation" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                           and_return(admin)
      create_user_reservations_with_items
      visit admin_reservations_path
      within(".reservations-list") do
        click_link_or_button "Reservation 00001"
      end
      expect(page).to have_content("Reservation 00001")
    end

    context "a link to" do
      xit "to cancel individual reservations which are currently 'ordered' or paid" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
        create_user_reservations_with_items
        visit admin_reservations_path
        within(".reservations-list") do
          click_link_or_button "Reservation 00001"
        end
        within("#reservation-status") do
          click_link_or_button "change to paid"
        end
        within("#reservation-status") do
          expect(page).to have_content("Status: paid")
        end
      end

      xit "'mark as completed' individual reservations which are currently 'paid'" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                              and_return(admin)
        create_user_reservations_with_items
        visit admin_reservations_path
        within(".reservations-list") do
          click_link_or_button "Reservation 00001"
        end
        within("#reservation-status") do
          click_link_or_button "change to complete"
        end
        within("#reservation-status") do
          expect(page).to have_content("Status: completed")
        end
      end

      xit "'cancel' individual reservations which are currently 'ordered' or 'paid'" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                              and_return(admin)
        create_user_reservations_with_items
        visit admin_reservations_path
        within(".reservations-list") do
          click_link_or_button "Reservation 00001"
        end
        within("#reservation-status") do
          click_link_or_button "change to cancel"
        end
        within("#reservation-status") do
          expect(page).to have_content("Status: cancelled")
        end
      end
    end
  end
end
