require 'spec_helper'

describe Event::EmailDecorator do
  let(:decorator) { Event::EmailDecorator.new( FactoryGirl.build(:email_event) )}
  it_behaves_like 'an event decorator'
end
