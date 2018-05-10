class TimeEntry < ApplicationRecord

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
