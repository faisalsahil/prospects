require "spec_helper"

describe ProspectMailer do
  describe "#default" do
    let(:user) { FactoryGirl.create(:user) }
    let(:prospect) { FactoryGirl.create(:snda) }

    it "should send an email" do
      ProspectMailer.requested_email(user, prospect, "keith.tom@gmail.com", "Niraj").deliver
      ActionMailer::Base.deliveries.should_not be_empty
    end
  end
end
