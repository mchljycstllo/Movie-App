module Api
  class AdminController < ApplicationController
    def dashboard
      genres = Genre.where(deleted: false).count
      artists = Artist.where(deleted: false).count
      movies = Movie.where(deleted: false).count
      users = Movie.where(deleted: false).count

      render json: {
        data: {
          genres: genres,
          artists: artists,
          movies: movies,
          users: users
        }
      }, status: :ok
    end
  end
end