module CurrentMovie
  private
    def set_movie
      begin
        @movie = Movie.find(params[:movie_id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
      end
    end

    #for fetching current movie
    def fetch_current_movie
      genre = @movie.genre
      comments = @movie.comments.includes(:user)
      ratings = @movie.ratings

      fetched_comments = []
      comments.each do |comment|
        comment_obj = {
          comment: comment,
          user: comment.user
        }
        comment.deleted == false ? fetched_comments.push(comment_obj) : nil
      end

      fetched_ratings = []
      ratings.each do |rating|
        rating.deleted == false ? fetched_ratings.push(rating) : nil
      end

      render json: {status: 'SUCCESS', msg: 'Loaded movie', data: {
        movie: @movie,
        genre: genre,
        comments: fetched_comments,
        ratings: fetched_ratings
      }}, status: :ok
    end
end