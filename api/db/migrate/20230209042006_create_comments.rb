class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true
      t.boolean :deleted, default: false
      t.text :content

      t.timestamps
    end
  end
end
