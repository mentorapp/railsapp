class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :mentors, through: :bookings
  has_many :mentees, through: :bookings
  has_many :reviews
  validates :username, presence: true, uniqueness: true
end
