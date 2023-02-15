class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model. 
  belongs_to :genre
  has_many :comments
  has_many :ratings
  has_many :favorites

  has_many :artist_movie
  has_many :artists, :through => :artist_movie

  validates :title, presence: true, uniqueness: false, length: { maximum: 200 }
  validates :release_year, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true, on: :create
  validates :image_alt, presence: true, uniqueness: false, length: { maximum: 50 }, on: :create
  validates :trailer_link, presence: true
  validates :description, presence: true
  
end
