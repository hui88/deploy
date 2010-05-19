class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :type_id,:null => false,:options =>
        "CONSTRAINT fk_product_types REFERENCES types(id)"      
    
      t.string :title
      t.text :description
      t.string :image_url
      t.text :instruction

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
