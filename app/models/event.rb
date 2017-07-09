class Event < ApplicationRecord
  has_many :event_topics, dependent: :destroy
  has_many :topics, through: :event_topics
  has_many :event_notifications, dependent: :destroy

  validates :name, :city, :start_date, :end_date, :topics, presence: true
  validate :end_date_more_than_start_date

  # Disabled until production server is configured properly
  #
  # after_create :schedule_event_notification

  private

  def end_date_more_than_start_date
    return if start_date.blank? || end_date.blank?

    if start_date >= end_date
      errors.add(:end_date, 'Must be greater than Start date')
    end
  end

  def schedule_event_notification
    EventNotificationWorker.perform_async(id)
  end
end
