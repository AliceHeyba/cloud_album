class Attachment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments
  has_many :likes
end
