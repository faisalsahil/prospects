require 'spec_helper'

describe Prospect do
  describe "#calculate_priority" do
    subject { FactoryGirl.create(:snda) }

    context "when a callback is due today" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::CALLBACK_LATER, :follow_up => Time.now.utc) }
      its(:calculate_priority) { should == 100 }
    end

    context "when a callback is due today and the call is made" do
      before do
        subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::CALLBACK_LATER, :follow_up => Time.now.utc)
        subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::REQUESTED_EMAIL) # represents the call being made
      end
      its(:calculate_priority) { should == 0 }
    end

    context "when a callback is due tomorrow" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::CALLBACK_LATER, :follow_up => Time.now.utc + 1.day) }
      its(:calculate_priority) { should == 0 }
    end

    context "when a callback is due yesterday" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::CALLBACK_LATER, :follow_up => Time.now.utc - 1.day) }
      its(:calculate_priority) { should == 100 }
    end

    context "when a click is recorded" do
      before { subject.email_events << FactoryGirl.create(:email_event, :prospect_id => subject.id, :type => Event::Email::CLICKED) }
      its(:calculate_priority) { should == 90 }
    end

    context "when a click is recorded and then we call 1 hour later" do
      before do
        subject.email_events << FactoryGirl.create(:email_event, :prospect_id => subject.id, :type => Event::Email::CLICKED)
        subject.call_events << c = FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::REQUESTED_EMAIL)
        c.update_attribute(:created_at, Time.now + 1.hours)
      end
      its(:calculate_priority) { should == 0 }
    end

    context "when two weeks have passed since they requested an email" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::REQUESTED_EMAIL, :created_at => 14.days.ago) }
      its(:calculate_priority) { should == 10 }
    end

    context "when more than two weeks have passed since they requested an email" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::REQUESTED_EMAIL, :created_at => 15.days.ago) }
      its(:calculate_priority) { should == 10 }
    end

    context "when less than two weeks have passed since they requested an email" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::REQUESTED_EMAIL, :created_at => 13.days.ago) }
      its(:calculate_priority) { should == 0 }
    end

    context "when 3 month or more have passed since we left a voicemail" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::VOICEMAIL, :created_at => 3.month.ago) }
      its(:calculate_priority) { should == 1 }
    end

    context "when less than 3 month have passed since we left a voicemail" do
      before { subject.call_events << FactoryGirl.create(:call_event, :prospect_id => subject.id, :type => Event::Call::VOICEMAIL, :created_at => 90.days.ago) }
      its(:calculate_priority) { should == -1 }
    end
  end
end
