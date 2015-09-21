class Admin::ProspectAssignmentsController < ApplicationController
  # on form submit, values will be an empty string
  def mass_create
    prospects = Prospect.search(params)
    prospects = prospects.limit(params[:limit]) if params[:limit].present?

    prospects.each do |prospect|
      # unassign everything for the prospect.  we want to behave like a prospect only has 1 assignment.
      ProspectAssignment.where(:prospect_id => prospect.id).destroy_all
      if params[:assign_to_user_id].present?
        # this queries unnecessarily but AR cache should handle it.
        user_id = User.find(params[:assign_to_user_id]).id
        ProspectAssignment.find_or_create_by_user_id_and_prospect_id(user_id, prospect.id)
      end
    end

    redirect_to admin_prospects_path(params)
  end
end
