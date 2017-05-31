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

  mount_uploader :profile_picture, PhotoUploader

end
