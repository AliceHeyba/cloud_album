class AttachmentsController < ApplicationController
  before_action :set_event, only: %i[new create destroy]



  def new
    @attachment = Attachment.new
  end


  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.event = @event
    if @attachment.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @attachment.destroy
    redirect_to event_path(@event), status: :see_other
  end

  private

  def set_event
    @event = Event.find[params[:event_id]]
  end

  def attachment_params
    params.require(:attachment).permit(:meta_picture, :caption, :posts)
  end
end
