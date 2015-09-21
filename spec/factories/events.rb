FactoryGirl.define do
  factory :call_event, :class => "Event::Call" do
    user { FactoryGirl.create(:user) }
    prospect { FactoryGirl.create(:snda) }
    type Event::Call::VOICEMAIL
  end

  factory :email_event, :class => "Event::Email" do
    prospect { FactoryGirl.create(:snda) }
    sent_email { FactoryGirl.create(:sent_email) }
    type Event::Email::SENT
  end
end

