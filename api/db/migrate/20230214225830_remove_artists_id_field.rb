class RemoveArtistsIdField < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :artists_id
  end
end
