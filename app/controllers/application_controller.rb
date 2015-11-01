class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_organizer.event
      event_path(current_organizer.event)
    else
      new_event_path
    end
  end
end
