module MovieConcern
  private
    def set_movie
      begin
        @movie = Movie.find(params[:movie_id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
      end
    end

    def fetch_all_movies
      to_return = []
      @movies = Movie.includes(:genre).where(:deleted => false)

      

      @movies.each do |movie|
        movie_obj = {
          movie: movie,
          genre: movie.genre,
          favorite: check_if_favorite
        }

        to_return.push(movie_obj)
      end
      render json: {status: 'SUCCESS', msg: 'Loaded movie', data: to_return}, status: :ok
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

    private 
    def check_if_favorite
      # favorite_movie = Favorite.where(:movie_id, @movie.id).where(:user_id, current_user.id)
      # return favorite_movie
      if !current_user
        return false
      else
        return true
      end
    end
end