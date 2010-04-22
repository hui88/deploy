class ProductAddUserId < ActiveRecord::Migration
  def self.up
    add_column :products,:user_id,:integer
  end

  def self.down
  end
end
