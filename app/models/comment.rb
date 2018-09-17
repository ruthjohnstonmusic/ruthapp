class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
  validates :body, presence: true
  validates :rating, numericality: {only_integer: true, message: "You must submit a valid rating."}
end
