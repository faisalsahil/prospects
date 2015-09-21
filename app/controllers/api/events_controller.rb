class Api::EventsController < ApplicationController
  respond_to :html, :json

  # This action handles file uploads.
  # I'd prefer to have direct amazon s3 uploads that happen independently.
  # Right now, we switched from AJAX post to normal HTML post.
  # This ties up our servers and isn't very scalable.
  # We got ajax post workign w/ remotipart but it just seems hacky.
  def create
    assert_valid_params!
    # consider slicing  params[:event] to only have valid keys
    Event.create_from_api!(params[:event])
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :created }
    end
  end

  private

  def assert_valid_params!
    # valid user_id ?
    if params[:event] && params[:event][:user_id] && params[:event][:user_id].to_i != current_user.id
      raise "unknown user id"
    end
  end
end
