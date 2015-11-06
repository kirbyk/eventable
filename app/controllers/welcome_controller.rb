class WelcomeController < ApplicationController
  def index
    @events = Event.where(organizer_id: current_organizer.id) if current_organizer
  end
end
