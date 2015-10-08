class UpdatesController < ApplicationController
  before_action :authenticate_organizer!

  def index
    @event_id = params[:event_id]
    event = Event.find_by(id: @event_id)
    if event.nil?
      flash[:notice] = "Event does not exist"
    else
      @updates = event.updates.order('created_at DESC')
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
      @update_id = params[:update_id]
      @update = Update.find_by(id: @update_id)      
    end    
  end
  
  def destroy
    id = params[:id]
    event_id = params[:event_id]
    update = Update.find_by(id: id)
    if update.nil?
      flash[:notice] = "Update does not exist"
    else
      update.destroy
    end
    return redirect_to action: "index", event_id: event_id    
  end  

  def create
    description = params["description"]
    event_id = params["event_id"]
    event = Event.find_by(id: event_id)
    if event.nil?
      flash[:notice] = "Event does not exist"
      return redirect_to action: "new"      
    end
    if description.nil? || description.length == 0
      flash[:notice] = "Description is required"
      return redirect_to action: "new", event_id: event_id      
    end    
    update_id = params[:update_id]
    if update_id.present?
      update = Update.find_by(id: update_id)
      unless update.nil?
        update.description = description
        update.save
      end
    else
      update = Update.new(description: description)
      event.updates << update
      event.save      
    end
      redirect_to action: "index", event_id: event_id     
  end
  
end
