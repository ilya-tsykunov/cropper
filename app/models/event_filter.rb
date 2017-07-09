class EventFilter < ApplicationRecord
  belongs_to :user
  belongs_to :topic, required: false

  validates :name, presence: true
  validate :start_date_end_greater_than_start_date_begin
  validate :at_least_one_condition_must_be

  private

  def start_date_end_greater_than_start_date_begin
    return if start_date_begin.blank? || start_date_end.blank?

    if start_date_begin >= start_date_end
      errors.add(:start_date_end, 'Must be greater than Start date end')
    end
  end

  def at_least_one_condition_must_be
    if [city, start_date_begin, start_date_end, topic].all?(&:blank?)
      errors.add(:base, 'You must fill at least one condition')
    end
  end
end
