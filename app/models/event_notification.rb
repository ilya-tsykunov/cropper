class EventNotification < ApplicationRecord
  belongs_to :event
  belongs_to :user

  scope :unwatched, -> { where(watched: false) }
end
