class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :hookers
  has_many :bookings
  has_many :reviews
  validates :email, presence: true
  validates :username, presence: true
  validates :date_of_birth, presence: true
  validate :old_enough?

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  protected

  def old_enough?
    errors.add(:date_of_birth, "You're too young.") unless date_of_birth < 18.years.ago
  end

 end
