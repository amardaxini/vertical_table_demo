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

ActiveRecord::Schema.define(:version => 20100124073051) do

  create_table "item_attributes", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.integer  "item_id"
    t.integer  "product_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_size"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "product_attributes", :force => true do |t|
    t.string   "name"
    t.string   "option_type"
    t.string   "option"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_searchable"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
