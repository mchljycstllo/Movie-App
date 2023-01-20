module Api
  class GenreController < ApplicationController
    def index
      genres = Genre.all().where(:deleted => false)
      render json: {status: 'SUCCESS', msg: 'Loaded data', data: genres}, status: :ok
    end

    def create
      genre = Genre.new(genre_params)

      if genre.save
        render json: {status: 'SUCCESS', msg: 'Saved genre', data: genre}, status: :ok
      else
        render json: {status: 'ERROR', msg: 'genre not saved', data: genre.errors}, status: :unprocessable_entity
      end
    end

    def show
      begin
        genre = Genre.find(params[:id])
        render json: {status: 'SUCCESS', msg: 'Loaded genre', data: genre}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', msg: 'No genre found', data: nil}, status: :unprocessable_entity
      end
    end

    def update
      begin
        genre = Genre.find(params[:id])
        if genre.update_attributes(genre_params)
          render json: {status: 'SUCCESS', msg: 'Updated genre', data: genre}, status: :ok
        else
          render json: {status: 'ERROR', msg: 'genre not saved', data: genre.errors}, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', msg: 'No genre found', data: nil}, status: :unprocessable_entity
      end
    end

    def destroy
      begin
        genre = Genre.where("id", params[:id], :deleted, false).first
        genre.update_attribute(:deleted, true)
        render json: {status: 'SUCCESS', msg: 'Deleted genre', data: genre}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', msg: 'No genre found', data: nil}, status: :unprocessable_entity
      end
    end

    private 
      def genre_params
        params.permit(:title)
      end

  end
end
