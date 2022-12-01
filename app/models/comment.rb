class Comment < ApplicationRecord
  belongs_to :attachment, dependent: :destroy
  belongs_to :user
end
