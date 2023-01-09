class Attachment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :posts
  has_many :favorites, dependent: :destroy

  validates :posts, presence: true
end
