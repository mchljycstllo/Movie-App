module Api
  class FrontendController < ApplicationController
    include MovieConcern

    def all_movies
      fetch_all_movies
    end

    def single_movie
      @fetch_related = true
      begin
        @movie = Movie.where(slug: params[:movie_slug]).first
        if @movie
          fetch_current_movie
        else
          render json: {status: 'ERROR', errors: ['Movie not found']}, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['Movie not found']}, status: :unprocessable_entity
      end
    end

    #POST user/favorites
    def get_user_favorites
      movies = []
      favorites = Favorite.where(deleted: false, user_id: params[:user_id])
      favorites.each do |favorite|
        movie = Movie.where(deleted: 0, id: favorite.movie_id).first
        movies.push(movie)
      end

      render json: {
        favorites: manipulate_movies(movies)
      }
    end

    #post frontend/search-movies
    def search_movies 
      search = params[:title]
      movies = Movie.where("title LIKE ?", "%#{search}%").where(deleted: false)
      
      render json:{
        data: manipulate_movies(movies),
        msg: 'loaded'
      }, status: :ok
    end

    #post frontend/all-artists
    def artist_landing_page
      to_return = []
      artists = fetch_all_artists
      artists.each do |artist|
        artist_obj = {
          artist: artist,
          movies_count: artist.movies.count
        }
        to_return.push(artist_obj)
      end
      render json: {status: 'SUCCESS', msg: 'All Artists', data: to_return}, status: :ok
    end

    def artist_inner_page
      artist = Artist.select('id', 'full_name', 'description', 'image', 'image_alt').where(deleted: false, id: params[:artist_id]).first
      if artist
        movies = artist.movies.select('id', 'genre_id', 'title', 'slug', 'image', 'image_alt').where(deleted: false)
        render json: {
          data: {
            artist: artist,
            movies: manipulate_movies(movies)
          }
        }, status: :ok
      else
        render json: {
          errors: ['Artist not found']
        }, status: :unprocessable_entity
      end
    end
  end
end