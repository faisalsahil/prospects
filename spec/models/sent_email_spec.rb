require 'spec_helper'

describe SentEmail do
  describe "#generate_slug" do
    it "should generate a unique slug" do
      sent_email = SentEmail.create!
      SecureRandom.should_receive(:hex).and_return(sent_email.slug, "unique")
      subject.send :generate_slug
      subject.slug.should == "unique"
    end
  end
end
