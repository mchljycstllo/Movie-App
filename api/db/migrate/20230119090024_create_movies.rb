class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.belongs_to :genre, null: false, foreign_key: true
      t.string :title
      t.integer :release_year
      t.text :description
      t.text :casts
      t.boolean :deleted, default: false
      t.text :image_src
      t.text :image_alt

      t.timestamps
    end
  end
end
