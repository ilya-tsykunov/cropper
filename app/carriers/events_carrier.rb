class EventsCarrier
  def initialize(user, params)
    @user = user
    @event_filter_params = params
  end

  def event_filter_carrier
    EventFilterCarrier.new(EventFilter.new(@event_filter_params))
  end

  def saved_event_filters
    @user.event_filters.order(:name)
  end

  def events
    filtering_service = EventFiltering.new(@event_filter_params)
    filtering_service.perform
    filtering_service.events
  end

  def event_filter_filtering_params(event_filter)
    result = { event_filter: {} }
    result[:event_filter][:city] = event_filter.city if event_filter.city.present?
    if event_filter.start_date_begin.present?
      result[:event_filter][:start_date_begin] = event_filter.start_date_begin
    end
    if event_filter.start_date_end.present?
      result[:event_filter][:start_date_end] = event_filter.start_date_end
    end
    result[:event_filter][:topic_id] = event_filter.topic_id if event_filter.topic_id.present?
    result
  end
end
