module Api
  class FrontendController < ApplicationController
    include MovieConcern

    def all_movies
      fetch_all_movies
    end

    def single_movie
      @fetch_related = true
      begin
        @movie = Movie.where(slug: params[:path]).first
        if @movie
          fetch_current_movie
        else
          render json: {status: 'ERROR', errors: ['movie not found']}, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['movie not found']}, status: :unprocessable_entity
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
      movies = Movie.where("title LIKE ?", "%#{search}%")
      
      render json:{
        data: manipulate_movies(movies),
        msg: 'loaded'
      }, status: :ok
    end
  end
end