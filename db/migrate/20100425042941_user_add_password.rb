class UserAddPassword < ActiveRecord::Migration
  def self.up
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    add_column :users, :password_salt, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :confirmed_at, :date
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :string
    add_column :users, :current_sign_in_at, :date
    add_column :users, :last_sign_in_at, :date
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :sign_in_count, :integer
    add_column :users, :remember_token, :string
  end

  def self.down
  end
end
