class CreateCrateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :crate_entries do |t|
      t.references :album, foreign_key: true
      t.references :crate, foreign_key: true

      t.timestamps
    end
  end
end
