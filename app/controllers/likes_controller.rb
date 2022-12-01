class LikesController < ApplicationController
  before_action :set_attachment, only: :create
  before_action :set_like, only: :destroy

  def create
    @like = Like.new
    @like.attachment = @attachment
    @like.user = current_user
    authorize @like
    if @like.save
      redirect_to attachment_path(@attachment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @like.destroy
    redirect_to attachment_path(@like.attachment), status: :see_other
  end



  private

  def set_attachment
    @attachment = Attachment.find(params[:attachment_id])
  end

  def set_like
    @like = Like.find(params[:id])
    authorize @like
  end
end
