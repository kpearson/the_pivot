require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) do
    User.new(first_name: "Alice",
             last_name: "Smith",
             email: "valid@gmail.com",
             about_me: "valid",
             display_name: "valid",
             password: "valid")
  end

  it "is valid" do
    expect(user).to be_valid
  end

  it "is not valid without a first name" do
    user.first_name = ""
    expect(user).to_not be_valid
  end

  it "is not valid without a last name" do
    user.last_name = ""
    expect(user).to_not be_valid
  end

  it "is not valid without email" do
    user.email = ""
    expect(user).to_not be_valid
  end

  it "is not valid improper email" do
    user.email = "invalidAtemail.com"
    expect(user.first_name).to eq("Alice")
    expect(user.last_name).to eq("Smith")
    expect(user).to_not be_valid
  end

  it "is not valid without display name" do
    user.display_name = ""
    expect(user).to_not be_valid
  end

  it "is not valid without an about me" do
    user.about_me = ""
    expect(user).to_not be_valid
  end

  it "is not valid with duplicate email" do
    User.create(first_name: "Different",
                last_name: "User",
                display_name: "valid",
                about_me: "valid",
                email: "valid@gmail.com",
                password: "password")
    expect(user).to_not be_valid
  end

  it "is not valid with a duplicate display name" do
    User.create(first_name: "Different",
                last_name: "User",
                display_name: "valid",
                about_me: "valid",
                email: "different@gmail.com",
                password: "password")
    expect(user).to_not be_valid
  end

  it "is valid with only lowercase and uppercase letters for displayname" do
    user.display_name = "Invalid_displayName"
    expect(user).to_not be_valid
  end

  it "can have orders" do
    expect(user.orders).to eq([])
  end

  it "is saved with a slug" do
    saved_user = User.create(first_name: "Valid",
                             last_name: "User",
                             display_name: "valid",
                             about_me: "valid",
                             email: "valid@email.com",
                             password: "password")
    expect(saved_user.slug).to eq("valid")
  end

  it "is not valid with a duplicate slug" do
    User.create(first_name: "Different",
                last_name: "User",
                display_name: "valid",
                about_me: "valid",
                email: "different@gmail.com",
                password: "password")
    invalid_user = User.create(first_name: "Valid",
                               last_name: "User",
                               display_name: "valid",
                               about_me: "valid",
                               email: "valid@email.com",
                               password: "password")
    expect(invalid_user).to_not be_valid
  end

  it "has a full name" do
    expect(user.full_name).to eq("Alice Smith")
  end

  it "has a default role" do
    expect(user.role).to eq("default")
    expect(user.default?).to eq(true)
    expect(user.host?).to eq(false)
  end
end
