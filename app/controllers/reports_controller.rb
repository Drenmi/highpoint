class ReportsController < ApplicationController
  def create
    @report = Report.new(params)
    render :index
  end

  def index
  end
end
