class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
  validates :content, presence: true

  def star_rating
    '⭐' * rating
  end
end
