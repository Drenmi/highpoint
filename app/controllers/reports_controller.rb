class ReportsController < ApplicationController
  def create
    @report = Report.new(donation_params)
    render :index
  end

  def index
  end

  def donation_params
    params.permit({ date: [:year, :month] }, :cause_id, :event_id)
  end
end
