class EventsController < ApplicationController
  before_action :prepare_modal_event

  def show
    @event = find_event(params[:id])
    @donations = if params[:search]
                   @event.donations.search(params[:search])
                 else
                   @event.donations
                 end
  end

  def index
    @events = if params[:search]
                Event.search(params[:search])
              else
                Event.all
              end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: "Event was successfully created."
    else
      redirect_to events_path, alert: @event.errors.full_messages.to_sentence
    end
  end

  private

  def prepare_modal_event
    @modal_event = Event.new
  end

  def event_params
    params.require(:event).permit(:name, :start_on, :end_on)
  end

  def find_event(id)
    Event.find(id)
  end
end
