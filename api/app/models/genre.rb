class Genre < ApplicationRecord
  has_many :movies
  validates :title, presence: true, uniqueness: false, length: { maximum: 100 }

  before_destroy :ensure_not_referenced_by_any_movie

  private
    def ensure_not_referenced_by_any_movie
      return false if movies.any?
    end
end
