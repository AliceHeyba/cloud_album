class CommentsController < ApplicationController
    before_action :set_attachment, only: %i[new create destroy]

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.attachment = @attachment
      if @comment.save
        redirect_to event_attachment_path(@attachment)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @comment.destroy
      redirect_to event_attachment_path(@attachment), status: :see_other
    end

    private

    def set_attachment
      @attachment = Attachment.find(params[:attachment_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
