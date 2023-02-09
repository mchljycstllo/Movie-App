class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true
      t.boolean :deleted, default: false
      t.integer :score, null: false
      t.timestamps
    end
  end
end
