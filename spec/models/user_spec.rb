require "spec_helper"
require "rspec"

describe User do

  user = FactoryGirl.build(:user)
  let(:username) {"robby"}
  let(:wrong_username) {"wrong"}
  let(:email) {"robby@aol.com"}
  let(:wrong_email) {"wrong@aol.com"}
  let(:invalid_email) {"invalid email"}
  let(:password) {"password"}
  let(:wrong_password) {"wrong password"}
  let(:too_short_password) {"short"}
  let(:bad_user_bad_email) { User.new(username: username, email: invalid_email, password: password )}
  let(:bad_user_bad_password) { User.new(username: username, email: email, password: too_short_password )}


  describe "#creation of object" do
    
    context "with valid input" do
     
      it "creates a new User with correct username" do
        expect(user.username).to eq username
      end
      
      it "does not create a User with incorrect username" do
        expect(user.username).not_to eq wrong_password
      end

      it "creates a new user with correct email" do
        expect(user.email).to eq email
      end

      it "does not create a User with incorrect email" do
        expect(user.email).not_to eq wrong_email
      end

    end

    context "with invalid input" do
      
      it "will not create a user with bad email" do
        expect(bad_user_bad_email).to_not be_valid
      end

      it "will not create a user with a password that is too short" do
        expect(bad_user_bad_password).to_not be_valid
      end

    end
  end
end