module ArtistConcern
  private 
  def fetch_all_artists
    artists = Artist.where(deleted: false)
  end
end