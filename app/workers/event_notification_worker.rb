class EventNotificationWorker
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)

    users_to_notify(event).find_each do |user|
      user.event_notifications.create(event: event, watched: false)
      UserMailer.event_notification(user, event).deliver_later
    end
  end

  def users_to_notify(event)
    topic_ids = event.topics.pluck(:id)

    User
      .left_outer_joins(:event_filters)
      .where(send_notifications: true)
      .where(<<-SQL, city: event.city, start_date: event.start_date, topic_ids: topic_ids)
        (event_filters.city is null or event_filters.city = '' or event_filters.city = :city)
        and (event_filters.start_date_begin is null or event_filters.start_date_begin <= :start_date)
        and (event_filters.start_date_end is null or event_filters.start_date_end >= :start_date)
        and (event_filters.topic_id is null or event_filters.topic_id in (:topic_ids))
      SQL
      .distinct
  end
end
