module Api
  class GenreController < ApplicationController
    before_action :authenticate_user!

    def index
      to_return = []

      genres = Genre.all().where(:deleted => false)
      genres.each do |genre|
        genre_obj = {
          genre: genre,
          movies: genre.movies.count
        }
        to_return.push(genre_obj)
      end

      render json: {status: 'SUCCESS', msg: 'Loaded data', data: to_return}, status: :ok
    end

    def create
      genre = Genre.new(genre_params)

      if genre.save
        render json: {status: 'SUCCESS', msg: 'Saved genre', data: genre}, status: :ok
      else
        render json: {status: 'ERROR', errors: ['genre not saved']}, status: :unprocessable_entity
      end
    end

    def show
      begin
        genre = Genre.find(params[:id])
        render json: {status: 'SUCCESS', msg: 'Loaded genre', data: genre}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No genre found']}, status: :unprocessable_entity
      end
    end

    def update
      begin
        genre = Genre.find(params[:id])
        if genre.update_attributes(genre_params)
          render json: {status: 'SUCCESS', msg: 'Updated genre', data: genre}, status: :ok
        else
          render json: {status: 'ERROR', errors: genre.errors}, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No genre found']}, status: :unprocessable_entity
      end
    end

    def destroy
      begin
        genre = Genre.where("id", params[:id], :deleted, false).first
        genre.update_attribute(:deleted, true)
        render json: {status: 'SUCCESS', msg: 'Deleted genre', data: genre}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No genre found']}, status: :unprocessable_entity
      end
    end

    private 
      def genre_params
        params.permit(:title)
      end

  end
end
