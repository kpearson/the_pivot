FactoryGirl.define do
  factory :user do
    first_name "Alice"
    last_name "Smith"
    display_name "valid"
    email "alica@email.com"
    about_me "I am Alice"
    password "password"
    password_confirmation "password"
  end

  factory :category do
    name "Condo"
  end

  factory :listing do
    before(:create) do |listing|
      listing.category = create(:category)
    end

    before(:create) do |listing|
      listing.user = create(:user, display_name: "validd",
                                   email: "asmith@emial.com")
    end

    title "New Listing"
    description "New Listing description"
    nightly_rate "100"
    max_guests "2"
    shared_bathroom true
    address1 "2424 W. Olive Ave."
    address2 "apt 2"
    city "Chicago"
    state "MI"
    zip "43601"
  end
end
