Given /^a valid prospect CSV file$/ do
  @prospect_csv_path = Rails.root.join('spec', 'fixtures', 'prospects.csv')
  File.exists?(@prospect_csv_path).should be_true
end

When /^I import the prospect CSV file$/ do
  ProspectImport.new(@prospect_csv_path).process!
end

Then /^I should have a database of prospects$/ do
  Prospect.count.should == 22
end
