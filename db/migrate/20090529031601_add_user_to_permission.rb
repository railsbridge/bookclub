class AddUserToPermission < ActiveRecord::Migration
  def self.up
    add_column :permissions, :user_id, :integer
  end

  def self.down
    remove_column :permissions, :user_id
  end
end
