class Favorite < ApplicationRecord
  belongs_to :attachment
  belongs_to :user
  validates :user_id, uniqueness: { scope: :attachment_id}
end
