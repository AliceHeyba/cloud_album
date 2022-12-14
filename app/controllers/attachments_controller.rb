class AttachmentsController < ApplicationController
  before_action :set_event, only: [:new, :create, :index]
  before_action :set_attachment, only: %i[show edit update destroy]

  def index
    @attachment = Attachment.new
    if params["user_selected"]&.empty?
      @attachments = policy_scope(Attachment).where(event: @event).order(created_at: :desc)
    elsif params["user_selected"]
      @user = User.find(params["user_selected"])
      @attachments = policy_scope(Attachment).where(event: @event, user: @user).order(created_at: :desc)
    else
      @attachments = policy_scope(Attachment).where(event: @event).order(created_at: :desc)
    end
    # @posts_count = []
    # @attachments.each { |att| @posts_count << att if att.posts.count > 1}
    # return @posts_count
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


    # @attachment.meta_creation = Exif::Data.new(File.open(params[:attachment][:posts][1].tempfile)).to_h.to_s
    # data = Exif::Data.new(File.open(params[:attachment][:posts][1].tempfile))

    authorize @attachment
    if @attachment.save
      redirect_to event_attachments_path(@event), notice: "Nice! Media uploaded succesfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @attachment.update(attachment_params)
      redirect_to attachment_path(@attachment), notice: "Media succesfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @attachment.destroy
    redirect_to event_attachments_path(@attachment.event), notice: "Media succesfully deleted"
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
    params.require(:attachment).permit(:caption, posts: [])
  end
end
