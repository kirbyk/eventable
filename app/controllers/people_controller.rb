class PeopleController < ApplicationController
  before_action :authenticate_organizer!

  def new
    @event = Event.find(params[:event_id])
    @person = Person.new
  end 

  def create
    @person = Person.new(person_params)
    @person.save
    redirect_to controller: "events", action: "show", id: person_params[:event_id]
  end

  def edit
    @event = Event.find(params[:event_id])
    @person = Person.find(params[:person_id])
  end

  def update
    @person = Person.find(params[:id]);
    if @person.update(person_params)
    end
    redirect_to controller: "events", action: "show", id: person_params[:event_id]
  end

  def destroy
    id = params[:id]
    person = Person.find_by(id: id)
    event_id = person.event_id
    if person.nil?
      flash[:notice] = "Person does not exist"
    else
      person.destroy
    end
    redirect_to controller: "events", action: "show", id: event_id
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :bio, :event_id)
  end
end
