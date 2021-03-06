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

ActiveRecord::Schema.define(:version => 20120901201612) do

  create_table "poems", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "prompt_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "poems", ["prompt_id"], :name => "index_poems_on_prompt_id"
  add_index "poems", ["user_id", "prompt_id"], :name => "index_poems_on_user_id_and_prompt_id"
  add_index "poems", ["user_id"], :name => "index_poems_on_user_id"

  create_table "prompts", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.text     "content"
    t.integer  "prompt_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "responses", ["prompt_id"], :name => "index_responses_on_prompt_id"
  add_index "responses", ["user_id", "prompt_id"], :name => "index_responses_on_user_id_and_prompt_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "user_followings", :id => false, :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "followed_user_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "user_followings", ["user_id", "followed_user_id"], :name => "index_user_followings_on_user_id_and_followed_user_id", :unique => true

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
