class Review < ApplicationRecord
  belongs_to :hooker
  belongs_to :user
end
