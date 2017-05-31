class Hooker < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :name, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true, numericality: true
  validates :street_nr, presence: true
  validates :short_description, presence: true
  validates :price, presence: true, numericality: true
  validates :user, presence: true
end
