class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def after_sign_in_path_for(resource)
    # if current_organizer.event
    #   root_path
    #   #event_path(current_organizer.event)
    # else
    #   new_event_path
    # end
    root_path
  end

  private
  def record_not_found(e)
    render 'errors/not_found', :status => 404
  end
end
