module EventsHelper
  def event_dates(event)
    if event.start_on == event.end_on
      (l event.start_on, format: :default).to_s
    elsif event.start_on.year != event.end_on.year
      "#{l event.start_on, format: :default} - #{l event.end_on, format: :default}"
    else
      "#{l event.start_on, format: :short} - #{l event.end_on, format: :default}"
    end
  end
end
