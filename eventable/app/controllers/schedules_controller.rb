class SchedulesController < ApplicationController
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
    @event_id= params[:event_id]
    @event = Event.find_by(id: @event_id)
    if @event.nil?
      flash[:notice] = "Event does not exist"
    end
  end
  
  def destroy
    id = params[:id]
    event_id = params[:event_id]
    schedule = Schedule.find_by(id: id)
    if schedule.nil?
      flash[:notice] = "Schedule does not exist"
    else
      schedule.destroy
    end
    return redirect_to action: "index", event_id: event_id    
  end
  
  def create    
    event_id= params[:event_id]
    @event = Event.find_by(id: event_id)
    if @event.nil?
      flash[:notice] = "Event does not exist"
      return redirect_to action: "new"
    else
      @description = params[:description]
      if @description.length == 0
        flash[:notice] = "Description is required"
        return redirect_to action: "new", event_id: event_id
      end      
      start_date = params[:start_date]
      end_date = params[:end_date]
      begin
        @start_date = Date.strptime(start_date, "%m/%d/%Y")
        @end_date = Date.strptime(end_date, "%m/%d/%Y")      
      rescue
        flash[:notice] = " Please select start date and end date with valid time format"
        return redirect_to action: "new", event_id: event_id
      end            
      # redirect to index      
      schedule = Schedule.new(description: @description, start_time: @start_date, end_time: @end_date)
      @event.schedules << schedule
      @event.save
      schedule.save
      redirect_to action: "index", event_id: event_id 
    end
  end
end