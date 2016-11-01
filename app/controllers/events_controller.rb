class EventsController < ApplicationController
  before_action :prepare_modal_event

  def create
    @event = Event.new(event_params)
    @events = Event.all

    respond_to do |format|
      if @event.save
        format.js { flash.now[:notice] = "Event was successfully created." }
        format.html { redirect_to events_path }
      else
        format.js
      end
    end
  end

  def index
    @events = if params[:search]
                Event.search(params[:search])
              else
                Event.all
              end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @event = find_event(params[:id])
    @donations = if params[:search]
                   @event.donations.search(params[:search])
                 else
                   @event.donations
                 end
  end

  # PATCH /update
  def update
    @event = find_event(params[:id])
    @events = Event.all

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path }
        format.js { flash.now[:notice] = "Event was successfully updated." }
      else
        format.js
      end
    end
  end

  # GET /edit
  def edit
    @event = find_event(params[:id])

    respond_to do |format|
      format.js
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
