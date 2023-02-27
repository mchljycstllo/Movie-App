module ArtistConcern
  private 
  def fetch_all_artists
    artists = Artist.where(deleted: false).order(full_name: :asc)
  end

  def delete_artist_movies
    #delete all artist movies first from this movie
    artist_movies = ArtistMovie.where(movie_id: @movie.id)
    artist_movies.each do |item|
      item.delete
    end
  end

  def fetch_movie_artists(movie)
    movie_artists = movie.artists
    return movie_artists
  end
end