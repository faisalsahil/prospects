Given /^the (.*?) prospect exists with the contact "(.*?)"$/ do |factory, contact_name|
  FactoryGirl.create(factory.downcase.to_sym, :contact_name => contact_name)
end

And /^the (.*) prospect is assigned to me$/ do |ticker|
  prospect = Prospect.find_by_ticker!(ticker)
  ProspectAssignment.find_or_create_by_user_id_and_prospect_id!(:user_id => @current_user.id, :prospect_id => prospect.id)
end

# make this step sound more like english
When /^I call and log a (.*?) event$/ do |type|
  click_link_or_button("Log Call")
  select(type, :from => "event_type")
  within "#call-modal" do
    click_link_or_button("Log Call")
  end
end

When /^I should see a (.*?) event on row (\d+)$/ do |type, row|
  within "#scheduling_demo_events .row-fluid:nth-child(#{row})" do
    page.should have_content "Called - #{type}"
  end
end

Then /^the (.*?) prospect's last event should be (.*?)$/ do |ticker, event|
  # for some reason, it doesn't work w/o sleeping for a bit
  sleep(0.125)
  prospect = Prospect.find_by_ticker!(ticker)
  prospect.reload.last_event.try(:type).should == event
end


When /^I call and send an email$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a sent email on row (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^the email is opened$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an opened email on row (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^the email is clicked$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a clicked email on row (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^the video is clicked$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a clicked video on row (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^the signup is clicked$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a clicked signup on row (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

