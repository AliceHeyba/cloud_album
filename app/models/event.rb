class Event < ApplicationRecord
  belongs_to :user
  has_many :attachments, dependent: :destroy
  has_one_attached :banner
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests
  has_many :users_with_attachments, through: :attachments, source: :user
  before_create :set_event_number

  def set_event_number
    self.event_number = generate_event_number
  end

  def generate_event_number
    random = SecureRandom.hex(5)
    return "#{random}"
  end
end
