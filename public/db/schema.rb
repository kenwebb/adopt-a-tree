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

ActiveRecord::Schema.define(:version => 20121116210340) do

  create_table "ltlocations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ownerships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rdlocations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reminders", :force => true do |t|
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "from_user_id",                    :null => false
    t.integer  "to_user_id",                      :null => false
    t.integer  "thing_id",                        :null => false
    t.boolean  "sent",         :default => false
  end

  add_index "reminders", ["from_user_id"], :name => "index_reminders_on_from_user_id"
  add_index "reminders", ["sent"], :name => "index_reminders_on_sent"
  add_index "reminders", ["thing_id"], :name => "index_reminders_on_thing_id"
  add_index "reminders", ["to_user_id"], :name => "index_reminders_on_to_user_id"

  create_table "species", :force => true do |t|
    t.string   "name"
    t.boolean  "edible"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "things", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "name"
    t.decimal  "lat",        :precision => 16, :scale => 14, :null => false
    t.decimal  "lng",        :precision => 17, :scale => 14, :null => false
    t.integer  "city_id"
    t.integer  "user_id"
  end

  add_index "things", ["city_id"], :name => "index_things_on_city_id", :unique => true

  create_table "treatments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trees", :force => true do |t|
    t.integer  "thing_id"
    t.integer  "ward_id"
    t.integer  "addnum"
    t.string   "addstr"
    t.integer  "ltlocation_id"
    t.integer  "rdlocation_id"
    t.boolean  "park"
    t.integer  "species_id"
    t.integer  "dbh"
    t.integer  "treatment_id"
    t.integer  "treatment_tagnum"
    t.boolean  "edible"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "ownership_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name",                                      :null => false
    t.string   "organization"
    t.string   "email",                                     :null => false
    t.string   "voice_number"
    t.string   "sms_number"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "admin",                  :default => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wards", :force => true do |t|
    t.string   "name"
    t.integer  "city_ward_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end