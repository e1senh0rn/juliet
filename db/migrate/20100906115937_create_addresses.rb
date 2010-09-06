class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :email, :null => false
      t.boolean :enabled, :default => true
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
