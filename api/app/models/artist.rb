class Artist < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :artist_movie
  has_many :movies, :through => :artist_movie

  validates :image, presence: true, on: :create
  validates :image_alt, presence: true, uniqueness: false, length: { maximum: 50 }, on: :create
  validates :full_name, presence: true
end
