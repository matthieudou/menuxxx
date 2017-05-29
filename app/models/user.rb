class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :hookers
  has_many :bookings
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :username, presence: true
  validates :date_of_birth, presence: true
end
