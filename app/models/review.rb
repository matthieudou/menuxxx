class Review < ApplicationRecord
  belongs_to :hooker
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: (0..5) }, numericality: { only_integer: true }
  validates :title, presence: true
end
