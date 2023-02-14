class RenameArtistMovieField < ActiveRecord::Migration[6.0]
  def change
    rename_column :artist_movies, :movies_id, :movie_id
  end
end
