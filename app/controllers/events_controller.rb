class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  # include Pundit
  # before_action :authorize, only: :find_event

  # after_action :create_qr, only: :create

  def index
      @events = policy_scope(Event).all
  end

  def new
    @event = Event.new
    authorize @event
  end

  def show
    @attachment = Attachment.new
    @event = Event.find(params[:id])
    @qr_code = RQRCode::QRCode.new("cloudalbum.xyz/events/#{@event.id}")
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end

  def find_event
    @event = Event.find_by(event_number: params[:event_number])
    if @event
      authorize @event
      redirect_to event_path(@event)
    else
      @event = Event.new
      authorize @event
      render "pages/find", status: :unprocessable_entity, notice: "Your event could not be found"
    end
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
    redirect_to root_path, notice: "Event succesfully deleted."
  end

  private

  def set_event
    @event = (Event.find(params[:id])) #||(Event.find(params[:event_number]))
    authorize @event
  end

  def event_params
    params.require(:event).permit(:event_date, :event_name, :event_description, :location, :banner, :qr_code)
  end
end
