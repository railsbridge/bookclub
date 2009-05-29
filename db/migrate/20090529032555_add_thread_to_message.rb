class AddThreadToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :thread_id, :integer
  end

  def self.down
    remove_column :messages, :thread_id
  end
end
