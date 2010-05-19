class DeviseUser < ActiveRecord::Migration
  def self.up
    add_column :users,:database_authenticatable,:boolean
    add_column :users,:recoverable,:boolean
    add_column :users,:rememberable,:boolean
    add_column :users,:trackable,:boolean
    add_column :users,:timestamps,:boolean
    
  end

  def self.down
    
  end
end
