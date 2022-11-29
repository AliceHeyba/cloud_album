class Event < ApplicationRecord
  belongs_to :user
  has_many :attachments
  has_one_attached :banner
end
