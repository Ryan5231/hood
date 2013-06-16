require 'spec_helper'

describe "sessions" do


  let(:username) {"ryan"}
  let(:email) {"ryan@aol.com"}
  let(:password) {"password"}
  let(:password_confirmation) {"password"}
  let(:bad_conf) {"passuod"}
  let(:label) {"neighborhood_My_Neighborhood"}
  let(:option) {"Castro"}
  let(:user1) {User.create(username: 'robby', email: 'robby@aol.com', password: 'password')}

  context "with valid info" do
    it "signs me up", :js=>true do
      Neighborhood.create(name: "Castro")
      visit root_path
      within ('#sign-up') do
        fill_in "user_username", :with => username
        fill_in "user_email", :with => email
        fill_in "user_password", :with => password
        fill_in "user_password_confirmation", :with => password_confirmation
        select(option, :from => "neighborhood")
      end
      click_button "Create User"
      page.should have_content "Profile"
    end
  end

  context "when password and confirmation don't match" do
    it "renders an error on the page", :js=>true do
      Neighborhood.create(name: "Castro")
      visit root_path
      within ('#sign-up') do
        fill_in "Username", :with => username
        fill_in "Email", :with => email
        fill_in "Password", :with => password
        fill_in "Password confirmation", :with => bad_conf
        select(option, :from => "neighborhood")
      end
      click_button "Create User"
      page.should have_content "Log in"
    end
  end

  context "with valid login info" do
    it "logs me in", :js=>true do
      hood = Neighborhood.create(name: "Castro")
      user = User.create(username: 'allen', 
                         email: 'allen@aol.com',
                         password: 'password',)
      user.neighborhoods << hood
      p user.neighborhoods[0]
      visit root_path
      within ('#sign-in') do
        fill_in "user_email", :with => "allen@aol.com"
        fill_in "user_password", :with => "password"
      end
      click_button "Log In"
      sleep 2
      page.should have_content "Profile"
    end
  end

  context "when wrong login info " do
    it "redirects you to main page", :js=>true do
      user = FactoryGirl.create(:user)
      visit root_path
      within ('#sign-in') do
        fill_in "Email", :with => user.email
        fill_in "Password", :with => bad_conf
      end
      click_button "Log In"
      page.should have_content "Incorrect"
    end
  end 
end