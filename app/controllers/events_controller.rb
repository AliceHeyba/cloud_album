class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event).all
  end

  def new
    @event = Event.new
    authorize @event
  end

  def show

  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save!
      redirect_to event_path(@event), notice: "Hurray! Event succesfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "Event succesfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event succesfully deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:event_date, :event_name, :event_description, :attendee_email, :banner)
  end
end
