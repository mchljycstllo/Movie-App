class Artist < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :movies, :through => :artist_movie

  validates :image, presence: true
  validates :image_alt, presence: true, uniqueness: false, length: { maximum: 50 }
  validates :full_name, presence: true
end
