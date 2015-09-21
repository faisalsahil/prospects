require 'spec_helper'

describe Event::CallDecorator do
  let(:decorator) { Event::CallDecorator.new( FactoryGirl.build(:call_event) )}
  it_behaves_like 'an event decorator'
end
