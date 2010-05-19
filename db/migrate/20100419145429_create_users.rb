class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :sex,:defualt => 'man'
      t.integer :QQ
      t.integer :phone
      t.text :address

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
