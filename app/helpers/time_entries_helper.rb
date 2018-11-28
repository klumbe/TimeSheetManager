module TimeEntriesHelper

  # create time based on current date and default entry
  def default_to_date(defaults, entry)
    return Time.zone.local(Time.current.year, Time.current.month, Time.current.day, defaults[entry][:hour], defaults[entry][:minute])
  end
end
