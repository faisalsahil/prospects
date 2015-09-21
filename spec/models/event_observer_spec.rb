require "spec_helper"

describe EventObserver do
  describe "#after_create" do
    let(:observer) { EventObserver.instance }
    let(:event) { FactoryGirl.create(:call_event) }
    let(:prospect) { event.prospect }

    context "given that there was a previous event" do
      let(:previous_event) { FactoryGirl.build(:call_event) }
      before { prospect.last_event = previous_event }

      it "should update the prospect's last event to the most recent" do
        expect { observer.after_create(event) }.to change{ prospect.last_event }
      end
    end

    it "should update the prospects priority" do
      prospect.should_receive(:calculate_priority)
      observer.after_create(event)
    end
  end
end
