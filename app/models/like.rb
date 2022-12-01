class Like < ApplicationRecord
  belongs_to :attachment, dependent: :destroy
  belongs_to :user
  validates :user_id, uniqueness: { scope: :attachment_id}
end
