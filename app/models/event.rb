class Event < ApplicationRecord
  has_many :event_topics, dependent: :destroy
  has_many :topics, through: :event_topics
end
