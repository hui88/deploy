class AddImageColumnToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :image_file_name,    :string
    add_column :products, :image_content_type, :string
    add_column :products, :image_file_size,    :integer
    add_column :products, :image_updated_at,   :datetime
  end

  def self.down
  end
end
