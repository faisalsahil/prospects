class Api::EmailsController < ApplicationController
  def create
    ProspectMailer.requested_email(current_user, Prospect.find(params[:email][:prospect_id]), params[:email][:to], params[:email][:name]).deliver
    head :created
  end
end
