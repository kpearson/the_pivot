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
end
