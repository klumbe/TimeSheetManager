module ApplicationHelper


  def current_class(current_path)
    if is_path_active?(current_path)
      return 'active'
    else
      return ''
    end
  end

  def add_span(current_path)
    if is_path_active?(current_path)
      return "<span class=\"sr-only\">(current)</span>"
    else
      return ''
    end
  end

  private
    def is_path_active?(current_path)
      return request.path == current_path
    end
end
