module MovieConcern
  include ArtistConcern, GenreConcern
  require 'json'
  private
    @fetch_related = false
    @is_admin = false #use this variable to fetch admin related data

    def set_movie
      begin
        @movie = Movie.find(params[:movie_id])
      rescue ActiveRecord::RecordNotFound
        render json: {status: 'ERROR', errors: ['Movie not found']}, status: :unprocessable_entity
      end
    end

    def fetch_all_movies
      
      if params.has_key?(:order_by_id)
        @movies = Movie.where(deleted: false).order(id: :desc)
      else
        @movies = Movie.where(deleted: false).order(title: :asc)
      end

      render json: {status: 'SUCCESS', msg: 'Loaded movie', data: manipulate_movies(@movies)}, status: :ok
    end

    #for fetching current movie
    def fetch_current_movie
      genre = @movie.genre
      comments = @movie.comments.where(deleted: false)
      ratings = @movie.ratings.where(deleted: false)

      #manipulate movies and ratings
      fetched_comments = manipulate_movie_comments(comments)
      
      related_movies = []
      if @fetch_related
        related_movies = fetch_related_movies(@movie)
      end

      #fetch all admin related data
      all_artists = []
      all_genres = []
      if @is_admin
        all_artists = fetch_all_artists
        all_genres = fetch_all_genres
      end 

      render json: {status: 'SUCCESS', msg: 'Loaded movie', data: {
        movie: @movie,
        genre: genre,
        comments: fetched_comments,
        favorite: check_if_favorite(@movie),
        related_movies: manipulate_movies(related_movies),
        no_of_ratings: ratings.length,
        ratings_score: get_ratings_score(@movie),
        artists: fetch_movie_artists(@movie),
        all_artists: all_artists,
        all_genres: all_genres
      }}, status: :ok
    end

    def check_if_favorite_1(movie) #TODO
      if !current_user
        return false
      else  
        favorite = Favorite.where(movie_id: movie.id, user_id: current_user.id, deleted: false).first
        
        favorite ? favorite.id : false
      end
    end

    def check_if_favorite(movie)
      if !params[:user_id]
        return false
      else
        favorite = Favorite.where(movie_id: movie.id, user_id: params[:user_id], deleted: false).first
        favorite ? favorite.id : false
      end
    end

    def manipulate_movies(movies)
      to_return = []
      movies.each do |movie|
        movie_obj = {
          movie: movie,
          genre: movie.genre,
          favorite: check_if_favorite(movie),
          no_of_ratings: movie.ratings.where(deleted: 0).count,
          ratings_score: get_ratings_score(movie),
          comment_count: movie.comments.where(deleted: false).count
        }

        to_return.push(movie_obj)
      end

      return to_return
    end

    def manipulate_movie_comments(comments)
      #ratings included here
      fetched_comments = []
      comments.each do |comment|
        user = comment.user
        #user_rating = Rating.select(:id, :user_id, :movie_id, :score).where(user_id: user.id, movie_id: @movie.id, deleted: false).first

        if params.has_key?(:movie_id)
          user_rating = Rating.select(:id, :user_id, :movie_id, :score).where(user_id: user.id, movie_id: params[:movie_id], deleted: false).first
        else
          user_rating = Rating.select(:id, :user_id, :movie_id, :score).where(user_id: user.id, movie_id: @movie.id, deleted: false).first
        end

        comment_obj = {
          comment: comment,
          user: user,
          user_rating: user_rating ? user_rating : nil
        }
        comment.deleted == false ? fetched_comments.push(comment_obj) : nil
      end

      return fetched_comments
    end


    def fetch_related_movies(movie)
      related_movies = Movie.where(
        genre_id: movie.genre.id,
        deleted: false
      ).where.not(
        id: movie.id
      )
      .limit(10)
    end

    def get_ratings_score(movie)
      total_score = 0
      ratings = movie.ratings.where(deleted: false)
      ratings_length = ratings.length

      ratings.each do |rating|
        total_score += rating.score
      end

      if total_score != 0 || ratings_length != 0
        return total_score / ratings_length
      else
        return 0
      end
      
    end
  
    def delete_movie_favorites
      favorites = Favorite.where(movie_id: @movie.id)
      favorites.each do |favorite|
        favorite.delete
      end
    end

    def fetch_artist_movies
      begin
        movies = []
        artist = Artist.select('id', 'full_name', 'image', 'image_alt').where(deleted: false, id: params[:artist_id]).first
        if artist
          movies = artist.movies.select('id', 'genre_id', 'title', 'slug', 'image', 'image_alt').where(deleted: false)
        end

        render json: {
          data: {
            artist: artist,
            movies: movies
          }
        }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {
          errors: ['Artist not found']
        }, status: :unprocessable_entity
      end
    end

    def fetch_genre_movies
      begin
        movies = []
        genre = Genre.where(deleted: false, id: params[:genre_id]).first
        
        if genre
          movies = genre.movies.select('id', 'genre_id', 'title', 'slug', 'image', 'image_alt').where(deleted: false)
        end

        render json: {
          data: {
            genre: genre,
            movies: movies
          }
        }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {
          errors: ['Genre not found']
        }, status: :unprocessable_entity
      end
    end

end