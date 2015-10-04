class EventsController < ApplicationController

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def show
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id]);
    if @event.update(event_params)
    end
  end

  def event_params
    params.require(:event).permit(:name, :app_logo, :event_type, :app_color, :organizer_id)
  end



end
