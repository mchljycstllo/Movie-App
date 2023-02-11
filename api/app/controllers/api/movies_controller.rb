module Api
  class MoviesController < ApplicationController
    before_action :set_current_movie, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    include MovieConcern

    # GET /movies
    def index
      fetch_all_movies
    end

    # GET /movies/1
    def show
      fetch_current_movie
    end

    # POST /movies
    def create
      @movie = Movie.new(movie_params)

      if @movie.save
        render json: @movie, status: :created, location: @movie
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /movies/1
    def update
      if @movie.update_attributes(movie_params)
        render json: {status: 'SUCCESS', msg: 'Updated movie', data: @movie}, status: :ok
      else
        render json: {status: 'ERROR', errors: ['movie not saved']}, status: :unprocessable_entity
      end
    end

    # DELETE /movies/1
    def destroy
      @movie.update_attribute(:deleted, true)
      render json: {status: 'SUCCESS', msg: 'Deleted movie', data: @movie}, status: :ok
      
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_current_movie
        begin
          @movie = Movie.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
        end
      end

      # Only allow a trusted parameter "white list" through.
      def movie_params
        params.permit(:title, :release_year, :movie_id, :casts, :image, :image_alt)
      end
  end
end