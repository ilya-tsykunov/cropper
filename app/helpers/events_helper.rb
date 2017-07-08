module EventsHelper
  def event_topics(event)
    event.topics.order(:name).pluck(:name).join(', ')
  end
end
