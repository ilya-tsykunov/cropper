class EventFiltersController < ApplicationController
  before_action :set_event_filter_carrier, only: %i(edit update destroy)

  def new
    @carrier = EventFilterCarrier.new(EventFilter.new(event_filter_params))
  end

  def edit; end

  def create
    @carrier = EventFilterCarrier.new(current_user.event_filters.new(event_filter_params))

    respond_to do |format|
      if @carrier.event_filter.save
        format.html { redirect_to events_path, notice: 'EventFilter was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @carrier.event_filter.update(event_filter_params)
        format.html { redirect_to events_path, notice: 'EventFilter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @carrier.event_filter.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'EventFilter was successfully destroyed.' }
    end
  end

  private

  def set_event_filter_carrier
    @carrier = EventFilterCarrier.new(EventFilter.find(params[:id]))
  end

  def event_filter_params
    params.require(:event_filter).permit(:name, :city, :start_date_begin, :start_date_end, :topic_id)
  end
end
