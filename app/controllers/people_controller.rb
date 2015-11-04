class PeopleController < ApplicationController
  before_action :authenticate_organizer!

  def new
    @person = Person.new
    @event = Event.find(params[:event_id])
  end 

  def edit
    @person = Person.find(params[:id])
    @event = Event.find(@person.event_id)
  end

  def create
    @person = Person.new(person_params)
    @event = Event.find(person_params[:event_id])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @event, notice: 'Mentor successfully added to event.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @person = Person.find(params[:id])
    @event = Event.find(person_params[:event_id])

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @event, notice: 'Mentor successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @event = Event.find(@person.event_id)

    @person.destroy

    respond_to do |format|
      format.html { redirect_to @event, notice: 'Mentor was successfully destroyed.' }
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :company, :skills, :event_id)
  end
end
