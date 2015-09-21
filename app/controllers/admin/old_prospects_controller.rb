class Admin::OldProspectsController < Admin::BaseController

  def index
    @admin = true
    prospects = Prospect.cold_caller_order.includes(:users, :call_events).search(params).paginate(:page => params[:page] || 1, :per_page => params[:per_page])
    @prospects = ProspectDecorator.decorate_collection(prospects)
  end

  # REFACTOR: views share a lot of code w/ prospects/show
  def show
    prospect = Prospect.find(params[:id])
    @prospect = ProspectDecorator.decorate(prospect)
    @tags = Prospect.tag_counts_on(:tags).order("name")
  end

end
