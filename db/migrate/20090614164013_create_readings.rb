class CreateReadings < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.integer :reader_id
      t.integer :read_id
      t.timestamps
    end
  end

  def self.down
    drop_table :readings
  end
end

