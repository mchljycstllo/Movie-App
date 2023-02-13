class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :full_name
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
