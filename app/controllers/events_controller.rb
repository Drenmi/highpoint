class EventsController < ApplicationController
  before_action :prepare_modal_event

  def create
    @event = Event.new(event_params)
    @events = Event.all

    respond_to do |format|
      if @event.save
        format.js {}
        format.html {}
        redirect_to events_path, notice: "Event was successfully created."
      else
        format.js
      end
    end
  end

  def index
    @events = EventsFinder.new(params).find_all.paginate(page: params[:page], per_page: 15)
    @search = params[:search] || nil
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @event = find_event(params[:id])
    @donations = DonationsFinder.new(params, @event).find_all.paginate(page: params[:page], per_page: 15)
    @search = params[:search] || nil
  end

  # PATCH /update
  def update
    @event = find_event(params[:id])
    @events = Event.all

    respond_to do |format|
      if @event.update(event_params)
        format.js {}
        format.html {}
        redirect_to events_path, notice: "Event was successfully updated."
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
