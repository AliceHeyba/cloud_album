class LikesController < ApplicationController
  before_action :set_attachment, only: %i[new create destroy]


  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.attachment = @attachment
    if @like.save
      redirect_to event_attachment_path(@attachment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @like.destroy
    redirect_to event_attachment_path(@attachment), status: :see_other
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:attachment_id])
  end
end
