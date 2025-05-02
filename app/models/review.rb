class Review < ApplicationRecord
  belongs_to :clothing

  validates :user_name, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, in: 1..5 }, allow_nil: true
end
