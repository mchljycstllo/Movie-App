class RenameCastsColumnInMoviesTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :casts_id, :artists_id
  end
end
