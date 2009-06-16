class AuthorsBooks < ActiveRecord::Migration
def self.up
    create_table 'authors_books' do |t|
      t.integer 'book_id'
      t.integer 'author_id'
    end
  end

  def self.down
    drop_table 'authors_books'
  end
end

