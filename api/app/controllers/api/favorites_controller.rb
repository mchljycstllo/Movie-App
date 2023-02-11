module Api
  class FavoritesController < ApplicationController
    before_action :set_favorite, only: [:show, :update, :destroy]
    before_action :set_movie, only: [:create]
    before_action :authenticate_user!

    include MovieConcern

    # GET /favorites
    def index
      @favorites = Favorite.all

      render json: @favorites
    end

    # GET /favorites/1
    def show
      render json: @favorite
    end

    # POST /favorites
    def create
      @favorite = Favorite.new(favorite_params)

      @existing_favorite = Favorite.where(
        user_id: params[:user_id],
        movie_id: params[:movie_id],
        deleted: false
      ).first


      if @existing_favorite
        render json: {status: 'ERROR', errors: ['already in favorites']}, status: :unprocessable_entity
      else
        if @favorite.save
          render json: @favorite, status: :created, location: @favorite
        else
          render json: @favorite.errors, status: :unprocessable_entity
        end
      end
    end

    # DELETE /favorites/1
    def destroy
      if check_user == 1
        @favorite.update_attribute(:deleted, 1)
        render json: {status: 'SUCCESS', msg: 'Deleted favorite', data: @favorite}, status: :ok
      else
        render json: {status: 'ERROR', errors: ["You don't have the right to remove from favorite"]}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_favorite
        begin
          @favorite = Favorite.find(params[:id])
        rescue
          render json: {status: 'ERROR', errors: ['No favorite found']}, status: :unprocessable_entity
        end
      end

      # Only allow a trusted parameter "white list" through.
      def favorite_params
        params.permit(:user_id, :movie_id)
      end

      def check_user
        if current_user.id == @favorite.user_id
          return 1
        else
          return 0
        end
      end
  end
end
