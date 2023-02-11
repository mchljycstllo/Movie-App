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
  end
end