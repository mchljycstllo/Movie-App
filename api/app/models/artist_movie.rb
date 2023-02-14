class ArtistMovie < ApplicationRecord
  belongs_to :artist
  belongs_to :movies
end
