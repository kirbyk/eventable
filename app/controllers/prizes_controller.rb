class PrizesController < ApplicationController
  before_action :authenticate_organizer!

  def new
    @event = Event.find(params[:event_id])
    @prize = Prize.new
  end 

  def create
    @prize = Prize.new(prize_params)
    @prize.save
    redirect_to controller: "events", action: "show", id: prize_params[:event_id]
  end

  def edit
    @event = Event.find(params[:event_id])
    @prize = Prize.find(params[:prize_id])
  end

  def update
    @prize = Prize.find(params[:id]);
    if @prize.update(prize_params)
    end
    redirect_to controller: "events", action: "show", id: prize_params[:event_id]
  end

  def destroy
    id = params[:id]
    prize = Prize.find_by(id: id)
    event_id = prize.event_id
    if prize.nil?
      flash[:notice] = "Person does not exist"
    else
      prize.destroy
    end
    redirect_to controller: "events", action: "show", id: event_id
  end

  def prize_params
    params.require(:prize).permit(:name, :event_id)
  end
end
