class User < ApplicationRecord
  has_many :attachments
  has_many :likes, through: :attachments
  has_many :comments, through: :attachments
  has_many :guests

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  def fullname
    return "#{first_name} #{last_name}"
  end

end
