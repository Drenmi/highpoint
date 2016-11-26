class DonationsReportsFinder
  def initialize(params)
    @year = params.dig(:date, :year)
    @month = params.dig(:date, :month)
    @cause_id = params[:cause_id]
    @event_id = params[:event_id]
    @result = Donation.all.includes(:cause)
  end

  def filter
    filter_by_year(@year) if @year.present?
    filter_by_month(@year, @month) if @month.present? && @year.present?
    filter_by_cause(@cause_id) if @cause_id.present?
    filter_by_event(@event_id) if @event_id.present?
    @result
  end

  private

  def filter_by_year(year)
    @result = @result.donations_for_year(year)
  end

  def filter_by_month(year, month)
    @result = @result.donations_for_month(year, month)
  end

  def filter_by_cause(cause_id)
    @result = @result.joins(:cause).where("causes.id = ?", cause_id)
  end

  def filter_by_event(event_id)
    @result = @result.joins(:event).includes(:event).where("events.id = ?", event_id)
  end
end
