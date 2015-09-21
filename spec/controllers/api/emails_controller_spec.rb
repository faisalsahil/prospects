require 'spec_helper'

describe Api::EmailsController do
  describe "#create" do
    it "should send an email" do
      pending "need to fake out auth"
      ProspectMailer.should_receive(:requested_email)
      post :create, :emails => "jack@example.com, jill@example.com", :prospect_id => 1
      response.should be_success
    end
  end
end
