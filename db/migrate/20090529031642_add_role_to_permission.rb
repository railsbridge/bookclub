class AddRoleToPermission < ActiveRecord::Migration
  def self.up
    add_column :permissions, :role_id, :integer
  end

  def self.down
    remove_column :permissions, :role_id
  end
end
