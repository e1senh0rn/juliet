class AddWorkflowToSite < ActiveRecord::Migration
  def self.up
    add_column :websites, :workflow_state, :string
  end

  def self.down
    remove_column :websites, :workflow_state
  end
end