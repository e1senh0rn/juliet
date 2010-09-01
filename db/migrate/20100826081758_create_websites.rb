class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.string :name, :null => false
      t.string :url, :null => false
      t.integer :ttl, :default => 0
      
      t.boolean :enabled, :default => true
      
      t.references :user

      t.timestamps
    end
    
    add_index :websites, :updated_at
    add_index :websites, :enabled
    
  end

  def self.down
    remove_index :websites, :updated_at
    remove_index :websites, :enabled
    drop_table :websites
  end
end