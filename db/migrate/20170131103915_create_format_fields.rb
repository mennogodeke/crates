class CreateFormatFields < ActiveRecord::Migration[5.0]
  def change
    create_table :format_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :format, foreign_key: true

      t.timestamps
    end
  end
end
