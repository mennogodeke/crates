class AddFormatToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :format_type_id, :integer
    add_column :albums, :properties, :text
  end
end
