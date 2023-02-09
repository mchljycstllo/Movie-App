class Genre < ApplicationRecord
  has_many :movies
  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }

  before_destroy :ensure_not_referenced_by_any_movie

  private
    def ensure_not_referenced_by_any_movie
      unless movies.empty?
        errors.add(:base, 'Movies Present')
        throw :abort
      end
    end
end
