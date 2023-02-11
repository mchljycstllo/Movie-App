module MovieConcern
  private
    @fetch_related = false

    def set_movie
      begin
        @movie = Movie.find(params[:movie_id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['No movie found']}, status: :unprocessable_entity
      end
    end

    def fetch_all_movies
      @movies = Movie.includes(:genre).where(deleted: false)
      render json: {status: 'SUCCESS', msg: 'Loaded movie', data: manipulate_movies(@movies)}, status: :ok
    end

    #for fetching current movie
    def fetch_current_movie
      genre = @movie.genre
      comments = @movie.comments.where(deleted: false).includes(:user)
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

      related_movies = []
      if @fetch_related
        related_movies = fetch_related_movies(@movie)
      end

      render json: {status: 'SUCCESS', msg: 'Loaded movie', data: {
        movie: @movie,
        genre: genre,
        comments: comments,
        ratings: fetched_ratings,
        favorite: check_if_favorite(@movie),
        related_movies: manipulate_movies(related_movies)
      }}, status: :ok
    end

    private 
    def check_if_favorite(movie)
      if !current_user
        return false
      else  
        favorite = Favorite.where(movie_id: movie.id, user_id: current_user.id, deleted: false).first
        
        favorite ? favorite.id : false
      end
    end

    def manipulate_movies(movies)
      to_return = []
      movies.each do |movie|
        movie_obj = {
          movie: movie,
          genre: movie.genre,
          favorite: check_if_favorite(movie)
        }

        to_return.push(movie_obj)
      end

      return to_return
    end


    def fetch_related_movies(movie)
      related_movies = Movie.where(
        genre_id: movie.genre.id,
        deleted: false
      ).where.not(
        id: movie.id
      )
    end
end