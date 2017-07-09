class User < ApplicationRecord
  devise(:database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable)

  has_many :event_filters, dependent: :destroy
  has_many :event_notifications, dependent: :destroy
end
