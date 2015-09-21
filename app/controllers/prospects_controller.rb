class ProspectsController < ApplicationController
  def index
    prospects = current_user.prospects.cold_caller_order.includes(:users, :call_events).search(params).paginate(:page => params[:page] || 1, :per_page => params[:per_page])
    @prospects = ProspectDecorator.decorate_collection(prospects)
  end

  # should not be scoped to user
  # but we should have authorization if non admin.
  def show
    prospect = Prospect.find(params[:id])
    @prospect = ProspectDecorator.decorate(prospect)
    @tags = Prospect.tag_counts_on(:tags).order("name")
  end
end
