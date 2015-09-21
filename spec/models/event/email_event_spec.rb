require 'spec_helper'

describe Event::Email do
  context "ActiveRecord touch" do
    subject { FactoryGirl.create(:email_event) }
    it "should update the prospect updated_at" do
      expect { subject.save }.to change { subject.prospect.updated_at }
    end
  end
end
