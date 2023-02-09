module CurrentMovie
  private
    def set_movie
      begin
        @movie = Movie.find(params[:movie_id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
      end
    end 
end