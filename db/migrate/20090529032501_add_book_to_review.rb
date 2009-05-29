class AddBookToReview < ActiveRecord::Migration
  def self.up
    add_column :reviews, :book_id, :integer
  end

  def self.down
    remove_column :reviews, :book_id
  end
end
