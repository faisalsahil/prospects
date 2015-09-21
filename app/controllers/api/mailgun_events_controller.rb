# Specific controller for mailgun API.  creates events like event api.
class Api::MailgunEventsController < ApplicationController
  respond_to :json
  # use before filter to validate authenticity

  def create
    sent_email = SentEmail.find_by_slug(params[:s])
    Event.create_from_api!(:category => "email", :type => params[:event].try(:titleize), :prospect_id => sent_email.prospect_id, :sent_email_id => sent_email.id)
    head :created
  end
end
