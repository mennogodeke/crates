class AddAvatarToLabel < ActiveRecord::Migration[5.0]
  def up
    add_attachment :labels, :avatar
  end

  def down
    remove_attachment :labels, :avatar
  end

end
