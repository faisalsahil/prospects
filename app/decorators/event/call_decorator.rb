class Event::CallDecorator < Draper::Decorator
  decorates_association :prospect

  delegate_all

  def body
    basic_info = []
    basic_info << h.display_time(model.created_at) if model.created_at.present?
    basic_info << "by: #{model.user.email}"
    basic_info << model.response if response.present?
    basic_info << "Follow up: #{h.display_time(model.follow_up)}" if model.follow_up.present?
    basic_info
  end

  def header
    "Called - #{model.type}"
  end

  # apply bootstrap success class when you schedule a demo.
  def css_class
    if model.type == Event::Call::SCHEDULED_DEMO
      "alert-info"
    else
    end
  end
end
