class EventsController < ApplicationController
  before_action :authenticate_organizer!

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    @event.organizer_id = current_organizer.id
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

  def build
    `cd lib/hackathon-template && ionic emulate ios` # TODO: such hack. Should use sidekiq
    redirect_to action: "show", id: params[:id]
  end

  def event_params
    params.require(:event).permit(:name, :app_logo, :event_type, :app_fgcolor, :app_bgcolor, :organizer_id)
  end
end
