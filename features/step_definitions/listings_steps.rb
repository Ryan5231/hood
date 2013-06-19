def the_listing
  Listing.last
end

def login(email, pwd)
  within '#sign-in' do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => pwd
    click_on 'Log In'
  end
end

Given(/^I have an existing listing titled "(.*?)"$/)  do |title|
  
  FactoryGirl.create(:listing, title: title, :realtor => @user, :neighborhood => @user.neighborhoods.last) # express the regexp above with the code you wish you had
end

Given(/^I am logged in as a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  @user = FactoryGirl.create(:user, :email => email, :password => password)
  @user.neighborhoods << FactoryGirl.create(:neighborhood)
  visit '/'
  login email, password
end

When(/^I change the title to "(.*?)"$/) do |title|
  @expected_title = title
  visit "/listings/#{the_listing.id}/edit"
  fill_in 'Title', :with => title
  click_on 'Edit Listing'
end

Then(/^I should see the corrected listing$/) do
  page.should have_content(@expected_title)
end
