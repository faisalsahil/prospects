When /^I visit (.*)$/ do |page|
  visit path_to(page)
end

When /^I click on "(.*?)"$/ do |target|
  click_link_or_button(target)
end

Then /^I should be on (.*?)$/ do |page_name|
  current_path.should eq path_to(page_name)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Given /^my user exists$/ do
  @current_user = FactoryGirl.create(:user, :password => "testing", :password_confirmation => "testing")
end

Given /^I am logged in$/ do
  visit path_to("the sign in page")
  fill_in "Email", :with => @current_user.email
  fill_in "Password", :with => "testing"
  click_link_or_button("Sign in")
end

And /^I sleep for (.*?) seconds$/ do |seconds|
  sleep(seconds.to_f)
end
