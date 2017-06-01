class Hooker < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true, numericality: true
  validates :street_nr, presence: true
  validates :short_description, presence: true
  validates :price, presence: true, numericality: true
  validates :user, presence: true
  validates_length_of :short_description, :maximum => 60
  validates_length_of :long_description, :maximum => 700

  mount_uploader :profile_picture, PhotoUploader

end


