class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hooker
  validates :start_date, presence: true
  validates :end_date, presence: true

  def total_price
    number_hours * price_per_hour
  end

  def number_hours
    #return a float
    (end_date - start_date) / 3600
  end

  def price_per_hour
    hooker.price
  end
end
