class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hooker
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_cannot_be_before_start_date

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

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end
end
