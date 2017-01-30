class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.references :artist, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
