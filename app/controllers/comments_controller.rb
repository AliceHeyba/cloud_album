class CommentsController < ApplicationController
    before_action :set_attachment, except: [:destroy, :update, :edit, :show]
    before_action :set_comment, only: %i[show edit update destroy]

    def create
      @comment = Comment.new(comment_params)
      @comment.attachment = @attachment
      @comment.user = current_user
      authorize @comment
      respond_to do |format|
        if @comment.save
          format.html { redirect_to attachment_path(@attachment) }
          format.json
      else
        format.html { render "attachmens/show", status: :unprocessable_entity }
        format.json
        end
      end
    end



    def edit
      @attachment = @comment.attachment
    end

    def update
      if @comment.update(comment_params)
        redirect_to attachment_path(@comment.attachment), notice: "Comment updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment.destroy
      redirect_to attachment_path(@comment.attachment), status: :see_other
    end

    private

    def set_attachment
      @attachment = Attachment.find(params[:attachment_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
      authorize @comment
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
