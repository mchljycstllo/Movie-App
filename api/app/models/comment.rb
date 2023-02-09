class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, presence: false, length: { minimum: 5, maximum: 500 }
  validates :user_id, presence: true
  validates :movie_id, presence: true
end
