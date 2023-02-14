class AddImageToArtistTable < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :image, :string
    add_column :artists, :image_alt, :string
  end
end
