class ProspectMailer < ActionMailer::Base
  
  def requested_email(user, prospect, to, name)
    sent_email = SentEmail.create!(:user_id => user.id, :prospect_id => prospect.id, :solicited => true, :to => to, :name => name)
    headers["X-Mailgun-Dkim"] = "yes"
    headers["X-Mailgun-Track"] = "yes"
    headers["X-Mailgun-Track-Clicks"] = "yes"
    headers["X-Mailgun-Track-Opens"] = "yes"
    headers["X-Mailgun-Variables"] = { :s => sent_email.slug }.to_json
    from = user.email
    mail(:from => from, :to => to, :subject => "Section 16 Simplified with Marketforms") do |format|
      format.html { render :partial => "prospect_mailer/requested_email", :locals => { :user => user, :contact_first_name => name } }
    end
    Event.create_from_api!(:category => "email", :prospect_id => prospect.id, :sent_email_id => sent_email.id, :type => Event::Email::SENT)
  end
end
