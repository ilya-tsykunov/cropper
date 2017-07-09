class EventFilterCarrier
  attr_reader :event_filter

  def initialize(event_filter)
    @event_filter = event_filter
  end

  def cities_collection
    Event.order(:city).pluck(:city).uniq
  end

  def topics_collection
    Topic.order(:name)
  end
end
