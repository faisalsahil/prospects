class Api::ProspectsController < ApplicationController
  respond_to :json

  def show
    prospect = Prospect.find(params[:id])
    respond_with prospect
  end

  def update
    prospect = Prospect.find(params[:id])
    prospect.update_attributes!(params[:prospect])
    respond_with prospect
  end
end
