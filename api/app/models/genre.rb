class Genre < ApplicationRecord
  has_many :movies
  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
end
