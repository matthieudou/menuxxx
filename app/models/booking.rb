class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hooker
end
