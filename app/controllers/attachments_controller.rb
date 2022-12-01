class AttachmentsController < ApplicationController
  before_action :set_event, only: [:new, :create, :index]
  before_action :set_attachment, only: %i[show edit update destroy]


  def index
    @attachments = policy_scope(Attachment).where(event: @event)
  end

  def new
    @attachment = Attachment.new
    authorize @attachment
  end

  def show
    @event = @attachment.event
    @comment = Comment.new
  end


  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.event = @event
    @attachment.user = current_user
    authorize @attachment
    if @attachment.save
      redirect_to attachment_path(@attachment), notice: "Nice! Attachments uploaded succesfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @attachment.update(attachment_params)
      redirect_to attachment_path(@attachment), notice: "Attachment succesfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @attachment.destroy
    redirect_to event_attachments_path(@event), notice: "Attachment succesfully deleted"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_attachment
    @attachment = Attachment.find(params[:id])
    authorize @attachment
  end

  def attachment_params
    params.require(:attachment).permit(:posts)
  end
end
