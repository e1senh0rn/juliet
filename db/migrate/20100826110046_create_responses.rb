class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :time
      t.integer :code
      t.boolean :timed_out, :default => false
      t.boolean :is_good, :default => true
      
      t.references :website

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
