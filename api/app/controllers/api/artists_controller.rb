module Api
  class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    include ArtistConcern

    # GET /artists
    def index
      artists = fetch_all_artists
      render json: {status: 'SUCCESS', msg: 'All Artists', data: artists}, status: :ok
    end

    # GET /artists/1
    def show
      render json: @artist
    end

    # POST /artists
    def create
      @artist = Artist.new(artist_params)

      if @artist.save
        render json: @artist, status: :created, location: @artist
      else
        render json: @artist.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /artists/1
    def update
      if @artist.update(artist_params)
        render json: @artist
      else
        render json: @artist.errors, status: :unprocessable_entity
      end
    end

    # DELETE /artists/1
    def destroy
      @artist.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_artist
        @artist = Artist.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def artist_params
        params.permit(:full_name)
      end
  end
end
