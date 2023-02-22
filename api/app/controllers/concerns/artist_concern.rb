module ArtistConcern
  private 
  def fetch_all_artists
    artists = Artist.where(deleted: false)
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

  
  def fetch_artist_movies
    artist = Artist.select('id', 'full_name', 'image', 'image_alt').where(deleted: false, id: params[:artist_id]).first
    movies = artist.movies.select('id', 'title', 'slug', 'image', 'image_alt').where(deleted: false)

    render json: {
      data: {
        artist: artist,
        movies: movies
      }
    }, status: :ok
  end
end