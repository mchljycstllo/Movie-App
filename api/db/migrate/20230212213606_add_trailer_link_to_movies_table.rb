class AddTrailerLinkToMoviesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :trailer_link, :string, null: false
  end
end
