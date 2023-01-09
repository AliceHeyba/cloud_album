class FavoritesController < ApplicationController
  before_action :set_attachment, only: :create
  before_action :set_favorite, only: :destroy

  def create
    @favorite = Favorite.new
    @favorite.attachment = @attachment
    @favorite.user = current_user
    authorize @favorite
    @favorite.save
    redirect_to attachment_path(@attachment)
  end

  def destroy
    @favorite.destroy
    redirect_to attachment_path(@favorite.attachment), status: :see_other
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:attachment_id])
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
    authorize @favorite
  end

  def like_params
    params.require(:favorite).permit(:attachment_id)
  end
end
