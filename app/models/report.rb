class Report
  attr_reader :year, :month, :cause_id, :event_id, :cause, :event

  def initialize(params)
    @year = params[:date][:year]
    @month = params[:date][:month]
    @cause_id = params[:cause_id]
    @event_id = params[:event_id]
    @cause = Cause.find_by(id: @cause_id)
    @event = Event.find_by(id: @event_id)
    @params = params
  end

  def donations
    DonationsReportsFinder.new(@params).filter
  end
end
