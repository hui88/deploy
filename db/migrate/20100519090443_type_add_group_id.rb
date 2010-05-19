class TypeAddGroupId < ActiveRecord::Migration
  def self.up
    add_column :types, :group_id, :integer
  end

  def self.down
  end
end
