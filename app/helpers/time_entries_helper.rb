module TimeEntriesHelper

  # create time based on current date and default entry
  def default_to_date(defaults, entry)
    return Time.zone.local(Time.current.year, Time.current.month, Time.current.day, defaults[entry][:hour], defaults[entry][:minute])
  end

  # returns existing month in supplied year (can be the supplied month)
  def get_existing_month(year, month)
    new_month = month
    if year == 'all'
      entries_in_year = TimeEntry.all
    else
      entries_in_year = TimeEntry.in_year(year)
    end
    if entries_in_year.in_month(month).empty?
      new_month = entries_in_year.group_by {|te| te.date.month}.keys.first
    end

    return new_month
  end

  # check if the user is allowed to access the time entry
  def user_allowed?
    allowed = current_user.id == @time_entry.user_id
    if !allowed
      flash[:alert] = 'You are not allowed to access this entry!'
    end
    return allowed
  end
end
