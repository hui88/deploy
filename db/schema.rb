# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100529114122) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                :null => false
    t.integer  "order_id",                                  :null => false
    t.integer  "quantity",                                  :null => false
    t.decimal  "total_price", :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id",                                                 :null => false
    t.decimal  "total_price",               :precision => 8, :scale => 2, :null => false
    t.string   "pay_type",    :limit => 10
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "type_id",                                                           :null => false
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.text     "instruction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",              :precision => 8, :scale => 2, :default => 0.0
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "QQ"
    t.integer  "phone"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "database_authenticatable"
    t.boolean  "recoverable"
    t.boolean  "rememberable"
    t.boolean  "trackable"
    t.boolean  "timestamps"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_salt"
    t.string   "encrypted_password"
    t.date     "confirmed_at"
    t.string   "confirmation_token"
    t.string   "confirmation_sent_at"
    t.date     "current_sign_in_at"
    t.date     "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.string   "remember_token"
    t.string   "role",                     :default => "member"
    t.string   "title"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
