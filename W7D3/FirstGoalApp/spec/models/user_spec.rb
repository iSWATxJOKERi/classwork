require 'rails_helper'

# model specs should test your model's 
    # validations, 
    # associations, and 
    # class scope methods (eg. User::find_by_credentials

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryBot.build(:user,
    username: "juanandlawrence",
    password: "Testing123")
  end

  describe "validations" do
    #validates the parameters
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:session_token)}
    it { should validate_presence_of(:password_digest)}

    #validates associations
    it { should have_many(:goals)}
    it { should have_many(:comments)}
  end

  describe "uniqueness" do
    before :each do
      create(:user)
    end

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "::find_by_credentials" do
    before { user.save! }
    before :each do
      create(:user)
    end
    it "should return the user if valid credentials" do
      expect(User.find_by_credentials("juanandlawrence", "Testing123")).to eq(user)
    end

    it "should return nil with invalid credentials" do
      expect(User.find_by_credentials("xxx","xxx")).to eq(nil)
    end
  end

  describe "#is_password?" do
    let!(:user) { create(:user) }
    it "return whether the password is a valid password" do
      expect(user.is_password?("polo")).to be false
      expect(user.is_password?("Testing123")).to be true
    end
  end

  describe "#reset_session_token!" do
    it "should reset user's session token" do
      old_token = user.session_token
      expect(user.reset_session_token!).not_to eq(old_token)
    end

    it "should give the user a new token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end
end