# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121102110919) do

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "decors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "interiors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "text"
    t.string   "tags"
    t.string   "picture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "permissions", ["name"], :name => "index_permissions_on_name", :unique => true

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "role_id",       :null => false
    t.integer "permission_id", :null => false
  end

  add_index "permissions_roles", ["role_id", "permission_id"], :name => "permissions_roles_idx"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "src_preview"
    t.string   "miniature_one"
    t.string   "miniature_two"
    t.date     "date_create"
    t.integer  "gallery_id"
    t.string   "city"
    t.boolean  "sell"
    t.string   "description"
    t.integer  "width"
    t.integer  "height"
    t.integer  "edition_one"
    t.integer  "edition_two"
    t.integer  "edition_three"
    t.integer  "size_one"
    t.integer  "size_two"
    t.integer  "size_three"
    t.integer  "price_one"
    t.integer  "price_two"
    t.integer  "price_three"
    t.integer  "decor_one"
    t.integer  "decor_two"
    t.integer  "decor_three"
    t.integer  "technology_id"
    t.integer  "color_id"
    t.integer  "colord_id"
    t.integer  "rubrik_id"
    t.integer  "rubrikd_id"
    t.string   "tags"
    t.integer  "raiting"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "roles_users_idx"

  create_table "rubriks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "technologies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "second_name"
    t.string   "name"
    t.string   "phone"
    t.string   "login"
    t.date     "birthday"
    t.string   "city"
    t.string   "about"
    t.string   "what_inspires"
    t.string   "avatar"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["phone"], :name => "index_users_on_phone", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
