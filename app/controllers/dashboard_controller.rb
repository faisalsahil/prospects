class DashboardController < ApplicationController
  def index
    @my_calls = current_user.call_events.by_week(Date.today).includes([:prospect, :user]).order("created_at DESC")
    @team_calls = Event::Call.by_date(Date.today).includes([:prospect, :user]).order("created_at DESC")
    @user_demos = current_user.call_events.scheduled_demo.includes(:prospect).by_date_range(Date.today, Date.today.end_of_week).order("created_at DESC")
  end
end
