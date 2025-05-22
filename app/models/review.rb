class Review < ApplicationRecord
  belongs_to :clothing
  belongs_to :parent, class_name: "Review", optional: true
  has_many :replies, class_name: "Review", foreign_key: "parent_id", dependent: :destroy
  def all_replies
    replies.includes(:replies)
  end
  validates :user_name, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, in: 1..5 }, allow_nil: true
end
