class EventsController < ApplicationController
  before_action :prepare_modal_event

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: "Event was successfully created."
    else
      redirect_to events_path, alert: "Failed to save event."
    end
  end

  private

  def prepare_modal_event
    @modal_event = Event.new
  end

  def event_params
    params.require(:event).permit(:name, :start_on, :end_on)
  end
end
