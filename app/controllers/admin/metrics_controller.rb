class Admin::MetricsController < ApplicationController

  def daily_calls
    @date = Date.parse(params[:date]) rescue Date.today
    @users = User.all
  end

  def weekly_calls
    @date = Date.parse(params[:date]) rescue Date.today
    @users = User.all
  end

  def all_calls
    @users = User.all
  end

  def calls_per_day
    @days = (1..31).map { |i| i.days.ago }
  end

  def prospects
    @prospects = Prospect.all
  end

  # background job emails it
  # we store it in ram and update it at intervals.
  def prospects_dump
    send_data ProspectCSV.generate, :filename => "prospects_dump.csv", :type => 'text/csv'
  end

  def tags
    @tags = Prospect.tag_counts_on(:tags)
    @tagged = Prospect.tagged_with(params[:tagged])
  end
end
