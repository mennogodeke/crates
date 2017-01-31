class AddFormatFieldToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :format_id, :integer
    add_column :albums, :properties, :text
  end
end
