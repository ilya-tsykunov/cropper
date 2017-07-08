class Topic < ApplicationRecord
  has_many :topic_events
  has_many :events, through: :topic_events

  validates :name, presence: true
end
