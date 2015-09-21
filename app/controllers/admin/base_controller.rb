class Admin::BaseController < ApplicationController
  before_filter :authorize_admin

  protected

  def authorize_admin
    unless current_user.admin?
      flash[:alert] = "You must be an authorized admin."
      redirect_to "/"
    end
  end
end
