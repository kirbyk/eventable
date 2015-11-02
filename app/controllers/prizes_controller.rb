class PrizesController < ApplicationController
  def new
    @event_id = params[:event_id]
    event = Event.find_by(id: @event_id)
    if event.nil?
      flash[:notice] = "Event does not exist"
    else
      @prizes = event.prizes
      @event_name = event.name      
    end     
  end 
end
