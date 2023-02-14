module Api
  class GenreController < ApplicationController
    #before_action :authenticate_user! TODO
    before_action :set_genre, only: [:show, :update, :destroy]

    def index
      to_return = []

      genres = Genre.all().where(deleted: false)
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
        errors = genre.errors[:title]
        render json: {status: 'ERROR', errors: errors}, status: :unprocessable_entity
      end
    end

    def show
      render json: {status: 'SUCCESS', msg: 'Loaded genre', data: @genre}, status: :ok
    end

    def update
      if @genre.update_attributes(genre_params)
        render json: {status: 'SUCCESS', msg: 'Updated genre', data: @genre}, status: :ok
      else
        render json: {status: 'ERROR', errors: @genre.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      genre = Genre.where(
        id: params[:id], 
        deleted: false
      ).first

      if genre
        if deletable(genre) == 1
          @genre.update_attribute(:deleted, true)
          render json: {status: 'SUCCESS', msg: 'Deleted genre', data: genre}, status: :ok
        else
          render json: {status: 'ERROR', errors: ['Genre contains movies. Cannot be deleted']}, status: :unprocessable_entity
        end
      else
        render json: {status: 'ERROR', errors: ['No genre found']}, status: :unprocessable_entity
      end
    end

    private 
      def genre_params
        params.permit(:title)
      end

      def set_genre
        begin
          @genre = Genre.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: {status: 'ERROR', errors: ['No genre found']}, status: :unprocessable_entity
        end
      end

      def deletable(genre)
        #count if genre contains movies. return 0 if contains movies. return 1 if not
        return genre.movies.count > 0 ? 0 : 1
      end

  end
end
