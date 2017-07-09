class EventFiltering
  attr_accessor :events

  def initialize(filter_params)
    @filter_params = filter_params
  end

  def perform
    filter_events
  end

  private

  def filter_events
    return @events if defined?(@events)

    @events = Event.all
    @events = with_city(@events)
    @events = with_start_date(@events)
    @events = with_topic(@events)
  end

  def with_city(events)
    city = @filter_params[:city]
    city.present? ? events.where(city: city) : events
  end

  def with_start_date(events)
    start_date_begin = @filter_params[:start_date_begin]
    if start_date_begin.present?
      events = events.where('start_date >= ?', start_date_begin)
    end

    start_date_end = @filter_params[:start_date_end]
    if start_date_end.present?
      events = events.where('start_date <= ?', start_date_end)
    end

    events
  end

  def with_topic(events)
    topic_id = @filter_params[:topic_id]

    return events if topic_id.blank?

    events.includes(:topics).where(topics: { id: topic_id })
  end
end
