class Event::EmailDecorator < Draper::Decorator
  decorates_association :prospect

  delegate_all

  def body
    if model.created_at
      ["To: #{model.sent_email.to}",
       h.display_time(model.created_at),
       "by: #{model.sent_email.user.email}"
      ]
    else
      []
    end
  end

  def header
    "Email #{model.type}"
  end

  def css_class
    "alert-info"
  end
end
