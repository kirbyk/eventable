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
    @update = Update.new
    @event = Event.find(params[:event_id])
  end

  def edit
    @update = Update.find(params[:id])
    @event = Event.find(@update.event_id)
  end

  def create    
    @update = Update.new(update_params)
    @event = Event.find(update_params[:event_id])

    respond_to do |format|
      if @update.save
        format.html { redirect_to @event, notice: 'Update successfully added to event.' }
      else
        format.html { render :new }
      end
    end
  end

  def update    
    @update = Update.find(params[:id])
    @event = Event.find(update_params[:event_id])

    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to @event, notice: 'Update successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @update = Update.find(params[:id])
    @event = Event.find(@update.event_id)

    @update.destroy

    respond_to do |format|
      format.html { redirect_to @event, notice: 'Update was successfully destroyed.' }
    end
  end
  
  private

  def update_params
    params.require(:update).permit(:title, :description, :event_id)
  end
end
