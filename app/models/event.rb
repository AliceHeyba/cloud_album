class Event < ApplicationRecord
  belongs_to :user
  has_many :attachments, dependent: :destroy
  has_one_attached :banner
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests
  has_many :users_with_attachments, through: :attachments, source: :user
end
