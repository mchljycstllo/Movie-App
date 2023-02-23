class AddDescriptionToArtistsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :description, :text, null: true
  end
end
