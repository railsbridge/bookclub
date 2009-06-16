class BooksGenres < ActiveRecord::Migration
  def self.up
    create_table 'books_genres', :id => :false do |t|
      t.integer 'genre_id'
      t.integer 'book_id'
    end
  end

  def self.down
    drop_table 'books_genres'
  end
end

