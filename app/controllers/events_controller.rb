class EventsController < ApplicationController
  before_action :authenticate_organizer!, except: [:schedule, :updates, :prizes, :mentors, :fgstyle, :bgstyle]
  layout false, only: [:app]

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    @event.organizer_id = current_organizer.id
    @event.save
    BuildAppWorker.perform_async({event_type: @event.event_type, event_id: @event.id, event_name: @event.name})
    redirect_to action: "show", id: @event.id
  end

  def index
    Event.delete(params[:id])
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
    # Set tab names
    @scheduleTab = "Schedule"
    @updatesTab = "Updates"
    @prizesTab = "Prizes"
    @peopleTab = "Mentors"
    case @event.event_type
    when "Wedding"
      @prizesTab = "Gifts"
      @peopleTab = "Wedding Party"
    when "Conference"
      @peopleTab = "Speakers"
    end

    @prizeType = "prize"
    case @event.event_type
    when "Wedding"
      @prizeType = "gift"
    end

    @peopleType = "mentor"
    case @event.event_type
    when "Wedding"
      @peopleType = "person"
    when "Conference"
      @peopleType = "speaker"
    end
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

  def schedule
    @schedule_items = Schedule.where(event_id: params[:id])
  end

  def updates
    @updates = Update.where(event_id: params[:id])
  end

  def prizes
    @prizes = Prize.where(event_id: params[:id])
  end

  def mentors
    @mentors = Person.where(event_id: params[:id])
  end

  def app
    @event = Event.find(params[:id])

    case @event.event_type
    when "Wedding"
      @template = "wedding-template"
    when "Hackathon"
      @template = "hackathon-template"
    when "Conference"
      @template = "conference-template"
    end
    
  end

  def build    
    @event = Event.find(params[:id]);
    BuildAppWorker.perform_async({event_type: @event.event_type, event_id: @event.id, event_name: @event.name})
  end

  def event_params
    params.require(:event).permit(:name, :app_logo, :event_type, :app_fgcolor, :app_bgcolor, :organizer_id)
  end

  def fgstyle
    @fgcolor = Event.find(params[:id]).app_fgcolor
  end

  def bgstyle
    @bgcolor = Event.find(params[:id]).app_bgcolor
  end
end
