module Api
  class RatingsController < ApplicationController
    before_action :set_rating, only: [:show, :update, :destroy]
    before_action :set_movie, only: [:create]

    include CurrentMovie

    # GET /ratings
    def index
      @ratings = Rating.all

      render json: @ratings
    end

    # GET /ratings/1
    def show
      render json: @rating
    end

    # POST /ratings
    def create
      @rating = Rating.new(rating_params)

      @existing_rating = Rating.where(user_id: params[:user_id]).where(movie_id: params[:movie_id]).where(deleted: 0).first

      if @existing_rating
        render json: {status: 'ERROR', errors: ['cannot add another rating']}, status: :unprocessable_entity
      else
        if @rating.save
          render json: @rating, status: :created, location: @rating
        else
          render json: @rating.errors, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /ratings/1
    def update
      if @rating.update(rating_params)
        render json: @rating
      else
        render json: @rating.errors, status: :unprocessable_entity
      end
    end

    # DELETE /ratings/1
    def destroy
      #@rating.destroy
      rating.update_attribute(:deleted, true)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_rating
        begin
          @rating = Rating.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
        end
      end

      # Only allow a trusted parameter "white list" through.
      def rating_params
        params.permit(:user_id, :movie_id, :score)
      end
  end
end
