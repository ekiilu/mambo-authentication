#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

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

ActiveRecord::Schema.define(:version => 20120620172943) do

  create_table "authentication_users", :force => true do |t|
    t.boolean  "system",                         :default => false, :null => false
    t.string   "name",            :limit => 64,                     :null => false
    t.string   "email_address",   :limit => 128,                    :null => false
    t.string   "password_digest", :limit => 64,                     :null => false
    t.string   "phone_number",    :limit => 10
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "authentication_users", ["email_address"], :name => "index_autentication_users_on_email_address", :unique => true
  add_index "authentication_users", ["name"], :name => "index_autentication_users_on_name", :unique => true

  create_table "authentication_roles", :force => true do |t|
    t.boolean  "system",                   :default => false, :null => false
    t.string   "name",       :limit => 64,                    :null => false
    t.string   "desc",       :limit => 64,                    :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "authentication_roles", ["name"], :name => "index_authentication_roles_on_name", :unique => true

  create_table "authentication_user_roles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentication_user_roles", ["user_id", "role_id"], :name => "index_authentication_user_roles_on_user_id_and_role_id", :unique => true

end
