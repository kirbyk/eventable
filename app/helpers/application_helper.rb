module ApplicationHelper
  def should_show_build
    if !@event
      return false
    elsif !@event.id
      return false
    else
      return true
    end
  end
end
