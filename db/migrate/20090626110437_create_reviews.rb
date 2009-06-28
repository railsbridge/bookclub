class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :book_id
      t.integer :user_id
      t.text :review
      t.integer :rating
      t.timestamps
    end
  end
  
  def self.down
    drop_table :reviews
  end
end
