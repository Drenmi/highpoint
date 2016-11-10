module ReportsHelper
  def year_only(report)
    report.month.empty? && report.cause_id.empty? && report.event_id.empty?
  end

  def year_and_month(report)
    !report.month.empty? && report.cause_id.empty? && report.event_id.empty?
  end

  def year_and_cause(report)
    report.month.empty? && !report.cause_id.empty? && report.event_id.empty?
  end

  def year_and_event(report)
    report.month.empty? && report.cause_id.empty? && !report.event_id.empty?
  end

  def year_and_month_and_cause(report)
    !report.month.empty? && !report.cause_id.empty? && report.event_id.empty?
  end

  def year_and_month_and_event(report)
    !report.month.empty? && report.cause_id.empty? && !report.event_id.empty?
  end

  def year_and_cause_and_event(report)
    report.month.empty? && !report.cause_id.empty? && !report.event_id.empty?
  end

  def year_and_month_and_cause_and_event(report)
    !report.month.empty? && !report.cause_id.empty? && !report.event_id.empty?
  end

  def display_chart(report)
    @display_chart = if year_only(report)
                       pie_chart Donation.includes(:cause).donations_for_year(report.year).group("causes.name").sum(:amount)
                     elsif year_and_month(report)
                       pie_chart Donation.includes(:cause).donations_for_month(report.year, report.month).group("causes.name").sum(:amount)
                     elsif year_and_cause(report)
                       area_chart Donation.includes(:cause).donations_for_year(report.year).where("causes.id = ?", report.cause_id).group_by_week("donations.created_at").sum(:amount)
                     elsif year_and_event(report)
                       area_chart Donation.includes(:event).donations_for_year(report.year).where("events.id = ?", report.event).group_by_week("donations.created_at").sum(:amount)
                     elsif year_and_month_and_cause(report)
                       area_chart Donation.includes(:cause).donations_for_month(report.year, report.month).where("causes.id = ?", report.cause_id).group_by_week("donations.created_at").sum(:amount)
                     elsif year_and_month_and_event(report)
                       area_chart Donation.includes(:event).donations_for_month(report.year, report.month).where("events.id = ?", report.event_id).group_by_week("donations.created_at").sum(:amount)
                     elsif year_and_cause_and_event(report)
                       area_chart Donation.includes(:cause).includes(:event).donations_for_year(report.year).where("causes.id = ? AND events.id = ?", report.cause_id, report.event_id).group_by_week("donations.created_at").sum(:amount)
                     elsif year_and_month_and_cause_and_event(report)
                       area_chart Donation.includes(:cause).includes(:event).donations_for_month(report.year, report.month).where("causes.id = ? AND events.id = ?", report.cause_id, report.event_id).group_by_week("donations.created_at").sum(:amount)
                     end
  end
end
