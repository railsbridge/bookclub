class AddAuthorToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :author_id, :integer
  end

  def self.down
    remove_column :books, :author_id
  end
end
