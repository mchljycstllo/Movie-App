class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.text :title
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
