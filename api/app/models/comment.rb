class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, presence: false, length: { minimum: 5, maximum: 500 }
end
