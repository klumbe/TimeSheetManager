class TimeEntry < ApplicationRecord
  belongs_to :user

  def total
    return Time.zone.at(self[:end] - self[:start] - (self[:breaks].hour * 3600 + self[:breaks].min * 60))
  end

  def total=(total)
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
