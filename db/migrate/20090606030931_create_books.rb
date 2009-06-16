class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.references :user
      t.string :title

      t.integer :published_year
      t.string :isbn
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

