class AddBookToThread < ActiveRecord::Migration
  def self.up
    add_column :threads, :book_id, :integer
  end

  def self.down
    remove_column :threads, :book_id
  end
end
