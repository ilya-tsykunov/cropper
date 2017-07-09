class EventsController < ApplicationController
  before_action :set_event, only: %i(show edit update destroy)

  def index
    @events_carrier = EventsCarrier.new(current_user, event_filter_params)
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :city, topic_ids: [])
  end

  def event_filter_params
    if params[:event_filter].present?
      params.require(:event_filter).permit(:name, :start_date_begin, :start_date_end, :city, :topic_id)
    else
      {}
    end
  end
end
