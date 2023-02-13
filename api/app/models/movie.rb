class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.   
  belongs_to :genre
  has_many :comments
  has_many :ratings
  has_many :favorites

  validates :title, presence: true, uniqueness: false, length: { maximum: 200 }
  validates :release_year, presence: true
  validates :genre_id, presence: true
  validates :artists_id, presence: true
  validates :image, presence: true
  validates :image_alt, presence: true, uniqueness: false, length: { maximum: 50 }
  validates :trailer_link, presence: true
  
end
