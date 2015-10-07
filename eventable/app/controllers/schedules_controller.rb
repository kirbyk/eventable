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
    @edit = params[:edit]    
    @event_id= params[:event_id]
    @event = Event.find_by(id: @event_id)
    if @event.nil?
      flash[:notice] = "Event does not exist"
    end
    if @edit.present?
      @schedule_id = params[:schedule_id]
      @schedule = Schedule.find_by(id: @schedule_id)      
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
      
      # protect ill-formatted "year" string because strptime does not treat it as exception
      unless (validate_date_format(start_date) && validate_date_format(end_date))
        flash[:notice] = "Please select start date and end date with valid time format"
        return redirect_to action: "new", event_id: event_id
      end              
      
      begin
        @start_date = Date.strptime(start_date, "%m/%d/%Y")
        @end_date = Date.strptime(end_date, "%m/%d/%Y")      
      rescue
        flash[:notice] = "Please select start date and end date with valid time format"
        return redirect_to action: "new", event_id: event_id
      end            
      # redirect to index           
      schedule_id = params[:schedule_id]
      if schedule_id.present?
        schedule = Schedule.find_by(id: schedule_id)
        unless schedule.nil?
          schedule.description = @description
          schedule.start_time = @start_date
          schedule.end_time = @end_date
          schedule.save
        end
      else
        schedule = Schedule.new(description: @description, start_time: @start_date, end_time: @end_date)
        @event.schedules << schedule
        @event.save
        schedule.save        
      end       
      redirect_to action: "index", event_id: event_id 
    end
  end
  
  private 
  
  def validate_date_format date
    strs = date.split("/")
    if strs.length != 3
      return false
    else
      year_str = strs.last
      if year_str.length != 4
        return false
      end
    end
    true
  end
  
end