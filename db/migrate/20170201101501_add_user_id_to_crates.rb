class AddUserIdToCrates < ActiveRecord::Migration[5.0]
  def change
    add_column :crates, :user_id, :integer
  end
end
