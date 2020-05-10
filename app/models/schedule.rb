class Schedule < ApplicationRecord
  has_many :days
  accepts_nested_attributes_for :days

  before_save :set_default_dates
  validates_presence_of :starts_at, :ends_at
  validate :dates_to_schedule, :repeat_scheduler

  private

  def set_default_dates
    starts_at = Time.now if starts_at.nil?
    ends_at   = Time.now if ends_at.nil?
  end

  def dates_to_schedule
    if starts_at <  Time.now || ends_at <  Time.now
      errors.add(:dates, "Schedules with past dates are not valid.")
    end
  end

  def repeat_scheduler
    if Schedule.where(starts_at: starts_at, ends_at: ends_at).exists?
      errors.add(:dates_scheduler, "You can't create repeated Schedules.")
    end
  end
end
