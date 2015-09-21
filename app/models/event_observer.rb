class EventObserver < ActiveRecord::Observer
  def after_create(event)
    update_prospect(event)
    # queue this as a background job
    DemoMailer.scheduled_demo(event).deliver if event.type == Event::Call::SCHEDULED_DEMO
  end

  protected

  def update_prospect(event)
    prospect = event.prospect
    prospect.last_event = event
    prospect.priority = prospect.calculate_priority # eventually this should be a delayed job
    prospect.save
  end
end
