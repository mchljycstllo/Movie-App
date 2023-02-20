module Api
  class MoviesController < ApplicationController
    before_action :set_current_movie, only: [:show, :update, :destroy]
    #before_action :authenticate_user! TODO

    include MovieConcern, ArtistConcern

    # GET /movies
    def index
      fetch_all_movies
    end

    # GET /movies/1
    def show
      @is_admin = true #instance variable to fetch all admin related data
      fetch_current_movie
    end

    # POST /movies
    def create
      @movie = Movie.new(movie_params)
      slug = movie_params[:title].parameterize
      existing_movie = Movie.where(slug: slug).order('id DESC')
      
      if existing_movie
        @movie.slug = "#{movie_params[:title].parameterize}-v-#{rand(1-100)}"
      else
        @movie.slug = movie_params[:title].parameterize
      end
      if @movie.save
        save_artist_movies
        render json: {status: 'SUCCESS', msg: 'Sved movie', data: @movie}, status: :ok
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /movies/1
    def update
      if @movie.update_attributes(movie_params)
        update_artist_movies
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

    #api for movie create page. fetch all artists and genres
    def movie_create_page
      artists = fetch_all_artists
      genres = fetch_all_genres

      render json: {status: 'SUCCESS', msg: 'fetched data', data: {
        artists: artists,
        genres: genres
      }}, status: :ok
    end

    def get_movie_comments
      begin
        movie = Movie.find(params[:movie_id])
        render json: {
          data: {
            movie: movie,
            comments: manipulate_movie_comments(movie.comments)
          }
        }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
      end
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
        params.permit(:title, :release_year, :movie_id, :genre_id, :artist_ids, :image, :image_alt, :trailer_link, :description)
      end

      def save_artist_movies
        artist_ids = params[:artist_ids]
        to_render = []
        artist_ids.each do |id|
          artist_movie = ArtistMovie.create(movie_id: @movie.id, artist_id: id)
          #to_render.push(artist_movie) #for debugging
        end
        # render json: {
        #   ids: to_render[0].errors.full_messages #for debugging
        # }
      end

      def update_artist_movies
        #delete all artist movies first from this movie
        artist_movies = ArtistMovie.where(movie_id: @movie.id)
        artist_movies.each do |item|
          item.delete
        end

        #save here
        save_artist_movies
      end

  end
end