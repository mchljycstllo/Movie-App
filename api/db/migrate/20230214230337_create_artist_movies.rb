class CreateArtistMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_movies do |t|
      t.belongs_to :artist, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
