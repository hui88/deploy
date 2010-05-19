class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
   #   t.integer :user_id,:null => false, :options =>
   #     "CONSTRAINT fk_order_users REFERENCES users(id)"
      t.integer :user_id,:null => false,:options =>
        "CONSTRAINT fk_order_users REFERENCES users(id)"      
      t.decimal :total_price,:null => false,:precision => 8,:scale => 2
      t.string :pay_type, :limit => 10
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
