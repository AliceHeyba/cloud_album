if @comment.persisted?
  json.form render(partial: "comments/form", formats: :html, locals: {attachment: @attachment, comment: Comment.new})
  json.inserted_item render(partial: "attachments/review", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {attachment: @attachment, comment: @review})
end
