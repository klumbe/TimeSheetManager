module TimeEntriesHelper

  # create time based on current date and default entry
  def default_to_date(defaults, entry)
    return Time.zone.local(Time.current.year, Time.current.month, Time.current.day, defaults[entry][:hour], defaults[entry][:minute])
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
