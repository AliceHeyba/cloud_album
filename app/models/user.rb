class User < ApplicationRecord
  has_many :attachments
  has_many :likes, through: :attachments
  has_many :comments, through: :attachments
  has_many :guests
  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def initials
    first_initial = first_name[0]
    last_initial = last_name[0]
    first_initial + last_initial
  end


  
  def fullname
    return "#{first_name} #{last_name}"
  end

end
