Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I have valid credentials$/ do
  User.create(email: 'zanewoodfin@gmail.com', new_password: 'password', new_password_confirmation: 'password')
end

Given /^I am logged in$/ do
  User.create(email: 'zanewoodfin@gmail.com', new_password: 'password', new_password_confirmation: 'password')
  visit login_path
  fill_in 'session_email', with: 'zanewoodfin@gmail.com'
  fill_in 'session_password', with: 'password'
  click_button 'Login'
end

When /^I follow the link to (.+)$/ do |the_link|
  click_link the_link
end

When /^I click (.+)$/ do |submit|
  click_button submit
end

When /^I fill in (.+) with (.+)$/ do |field, value|
  fill_in "session_#{field}", with: value
end

Then /^I should be at the (.+) page$/ do |page_name|
  find('h1').should have_content page_name
end

Then /^I should be logged in$/ do
  find('#flash').find('div').should have_content 'logged in'
end

Then /^I should be logged out$/ do
  find('#flash').find('div').should have_content 'logged out'
  find_link('Login').visible?.should be_true
end
