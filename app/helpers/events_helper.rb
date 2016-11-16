module EventsHelper
  def event_dates(event)
    if event.start_on == event.end_on
      "#{l event.start_on, format: :default}"
    elsif event.start_on.year != event.end_on.year
      "#{l event.start_on, format: :default} - #{l event.end_on, format: :default}"
    else
      "#{l event.start_on, format: :short} - #{l event.end_on, format: :default}"
    end
  end

  def event_whodunnit(event)
    if event.versions.last&.event == "update"
      "Last updated on #{l event.versions.last.created_at.localtime} by #{User.where('id = ?', event.versions.last.whodunnit).first.email}"
    elsif event.versions.last&.event == "create"
      "Created on #{l event.created_at.localtime} by #{User.where('id = ?', event.versions.last&.whodunnit).first.email}"
    else
      "Created on #{l event.created_at.localtime}"
    end
  end
end
