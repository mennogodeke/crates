class DeleteFieldsFromAlbums < ActiveRecord::Migration[5.0]
  def change
    remove_column :albums, :format_type_id
    remove_column :albums, :properties
  end
end
