class ProspectDecorator < Draper::Decorator
  delegate_all

  def scheduling_demo_events
    @scheduling_demo_events ||= (call_events + email_events).sort_by(&:created_at)
  end

  # This was a hack because calling sort on a .decorated(array) will return
  # the original objects and not the decorators. :(
  def call_events
    model.call_events.map{|c| Event::CallDecorator.new(c) }
  end

  # This was a hack because calling sort on a .decorated(array) will return
  # the original objects and not the decorators. :(
  def email_events
    model.email_events.map{|c| Event::EmailDecorator.new(c) }
  end

  def new_call_event
    Event::Call.new(:user_id => h.current_user.id, :prospect_id => prospect.id)
  end

  def new_sent_email
    SentEmail.new(:to => prospect.contact_email,
                  :name => prospect.contact_name.to_s.split(' ').first,
                  :prospect_id => prospect.id,
                  :solicited => true)
  end

  # Public: Last event decorated appropriately. I had to do all this meta
  # stuff because draper doesnt understand polymorphic associations. :(
  def last_event
    if model.last_event.present?
      "#{model.last_event.class}Decorator".constantize.new(model.last_event)
    end
  end

  def last_event_header
    last_event && last_event.header
  end

  def last_event_time
    last_event && (h.distance_of_time_in_words(Time.now, last_event.created_at) + " ago")
  end
end
