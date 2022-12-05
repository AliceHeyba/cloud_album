class Comment < ApplicationRecord
  belongs_to :attachment
  belongs_to :user

  def user_initials
    user.initials
  end
end
