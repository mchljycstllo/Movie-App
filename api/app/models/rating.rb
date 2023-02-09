class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :score, presence: true, numericality: { 
    only_integer: true,
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }
  validates :user_id, presence: true
  validates :movie_id, presence: true
end
