class EventsController < ApplicationController

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to action: "show", id: @event.id
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id]);
    if @event.update(event_params)
    end
    redirect_to action: "show", id: @event.id
  end

  def event_params
    params.require(:event).permit(:name, :app_logo, :event_type, :app_color, :organizer_id)
  end



end
