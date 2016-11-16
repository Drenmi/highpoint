class Report
  attr_reader :year, :month, :cause_id, :event_id

  def initialize(params)
    @year = params[:date][:year]
    @month = params[:date][:month]
    @cause_id = params[:cause_id]
    @event_id = params[:event_id]
  end
end
