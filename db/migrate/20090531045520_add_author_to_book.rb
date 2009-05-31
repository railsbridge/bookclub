class AddAuthorToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :author, :string
  end

  def self.down
    remove_column :books, :author
  end
end
