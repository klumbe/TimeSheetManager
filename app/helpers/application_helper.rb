module ApplicationHelper

  def current_class(current_path)
    if request.path == current_path
      return 'active'
    else
      return ''
    end
  end
end
