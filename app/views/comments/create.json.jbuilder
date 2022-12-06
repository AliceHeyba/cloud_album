if @comment.persisted?
  json.form render(partial: "comments/form", formats: :html, locals: {attachment: @attachment, comment: Comment.new})
  json.inserted_item render(partial: "comments/comment", formats: :html, locals: {attachment: @attachment, comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {attachment: @attachment, comment: @comment})
end
