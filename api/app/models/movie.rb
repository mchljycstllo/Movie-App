class Movie < ApplicationRecord
  belongs_to :genre

  validates :title, presence: true, uniqueness: false, length: { maximum: 200 }
  validates :release_year, presence: true
  validates :genre_id, presence: true
  validates :casts, presence: true
end
