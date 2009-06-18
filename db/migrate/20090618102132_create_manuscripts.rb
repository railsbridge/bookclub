class CreateManuscripts < ActiveRecord::Migration
  def self.up
    create_table :manuscripts do |t|
      t.integer :book_id
      t.integer :author_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :manuscripts
  end
end
