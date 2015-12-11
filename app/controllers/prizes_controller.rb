class PrizesController < ApplicationController
  before_action :authenticate_organizer!

  def setPrizeType
    @prizeType = "prize"
    case @event.event_type
    when "Wedding"
      @prizeType = "gift"
    end
  end

  def new
    @prize = Prize.new
    @event = Event.find(params[:event_id])
    setPrizeType
  end 

  def edit
    @prize = Prize.find(params[:id])
    @event = Event.find(@prize.event_id)
    setPrizeType
  end

  def create
    @prize = Prize.new(prize_params)
    @event = Event.find(prize_params[:event_id])

    respond_to do |format|
      if @prize.save
        format.html { redirect_to @event, notice: 'Prize successfully added to event.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @prize = Prize.find(params[:id])
    @event = Event.find(prize_params[:event_id])

    respond_to do |format|
      if @prize.update(prize_params)
        format.html { redirect_to @event, notice: 'Prize successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @prize = Prize.find(params[:id])
    @event = Event.find(@prize.event_id)

    @prize.destroy

    respond_to do |format|
      format.html { redirect_to @event, notice: 'Prize was successfully destroyed.' }
    end
  end

  private

  def prize_params
    params.require(:prize).permit(:company, :description, :award, :event_id)
  end
end
