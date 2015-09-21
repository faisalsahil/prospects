class DemoMailer < ActionMailer::Base
  default from: "do-not-reply@marketforms.net"

  def scheduled_demo(event)
    @prospect = event.prospect
    @event = event
    mail(:to => "sales@marketforms.com", :subject => "A demo has been scheduled! #{event.follow_up.try(:strftime, '%b. %-d %l:%M%P %Z')}")
  end
end
