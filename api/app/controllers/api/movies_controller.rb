module Api
  class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :update, :destroy]

    # GET /movies
    # GET /movies
    def index
      records = []
      @movies = Movie.all.where(:deleted => false)
      
      @movies.each do |movie|
        movie_obj = {
          :movie => movie,
          :genre => Genre.find(movie.genre_id)
        }
        records.push(movie_obj)
      end

      render json: {status: 'SUCCESS', msg: 'Loaded movies', data: records}, status: :ok
    end

    # GET /movies/1
    def show
      begin
        movie = Movie.find(params[:id])
        render json: {status: 'SUCCESS', msg: 'Loaded movie', data: movie}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', msg: 'No movie found', data: nil}, status: :unprocessable_entity
      end
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
      begin
        movie = Movie.find(params[:id])
        if movie.update_attributes(movie_params)
          render json: {status: 'SUCCESS', msg: 'Updated movie', data: movie}, status: :ok
        else
          render json: {status: 'ERROR', msg: 'movie not saved', data: movie.errors}, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', msg: 'No movie found', data: nil}, status: :unprocessable_entity
      end
    end

    # DELETE /movies/1
    def destroy
      begin
        movie = Movie.where("id", params[:id], :deleted, false).first
        movie.update_attribute(:deleted, true)
        render json: {status: 'SUCCESS', msg: 'Deleted movie', data: movie}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', msg: 'No movie found', data: nil}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_movie
        @movie = Movie.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def movie_params
        params.permit(:title, :release_year, :genre_id, :casts, :image, :image_alt)
      end
  end
end
