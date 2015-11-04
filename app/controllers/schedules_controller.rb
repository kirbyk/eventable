class SchedulesController < ApplicationController
  before_action :authenticate_organizer!

  def index
    @event_id = params[:event_id]
    event = Event.find_by(id: @event_id)
    if event.nil?
      flash[:notice] = "Event does not exist"
    else
      @schedules = event.schedules
      @event_name = event.name      
    end        
  end
  
  def new
    @schedule = Schedule.new
    @event = Event.find(params[:event_id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @event = Event.find(@schedule.event_id)
  end

  def create    
    @schedule = Schedule.new(schedule_params)
    @event = Event.find(schedule_params[:event_id])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @event, notice: 'Schedule item successfully added to event.' }
      else
        format.html { render :new }
      end
    end
  end

  def update    
    @schedule = Schedule.find(params[:id])
    @event = Event.find(schedule_params[:event_id])

    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @event, notice: 'Schedule item successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @event = Event.find(@schedule.event_id)

    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to @event, notice: 'Schedule item was successfully destroyed.' }
    end
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:title, :description, :start_time, :end_time, :event_id)
  end
end
