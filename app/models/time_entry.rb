class TimeEntry < ApplicationRecord
  belongs_to :user

  validate :end_time_cannot_be_lower_than_start_time, :total_cannot_be_negative

  def total
    if total_minutes < 0
      return Time.zone.at(0)
    else
      return Time.zone.at(total_minutes)
    end
  end

  def total_minutes
    return self[:end] - self[:start] - (self[:breaks].hour * 3600 + self[:breaks].min * 60)
  end

  def total=(total)
  end

  def end_time_cannot_be_lower_than_start_time
    if self[:end] < self[:start]
      errors.add(:end, "can't be before the start")
      errors.add(:start, "can't be after the end")
    end
  end

  def total_cannot_be_negative
    if total_minutes < 0
      errors.add(:total, "can't be negative")
    end
  end

  def self.round_time(time)
    step = 15
    distance = time.to_i % (60 * step)
    new_time = time - distance
    if distance > ((step * 60) / 2)
      new_time += step * 60
    end
    return new_time
  end

end
