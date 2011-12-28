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

ActiveRecord::Schema.define(:version => 20111228212450) do

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "command"
    t.boolean  "allowed"
    t.datetime "last_used"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_used_by"
  end

  create_table "commands", :force => true do |t|
    t.string   "command"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "last_used"
    t.integer  "last_used_by"
    t.datetime "updated_at"
    t.integer  "added_by"
  end

  create_table "errors", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.string   "command"
    t.datetime "last_used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms", :force => true do |t|
    t.datetime "received_at"
    t.string   "command"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "api"
    t.string   "call_id"
    t.string   "from"
    t.string   "to"
    t.text     "content"
    t.datetime "dateCreated"
    t.boolean  "app_started"
  end

  create_table "sms_answers", :force => true do |t|
    t.string   "uri"
    t.string   "response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.text     "body"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "login"
    t.string   "email"
    t.datetime "deleted_at"
    t.integer  "deleted_by_id"
    t.string   "deleted_reason"
    t.datetime "created_at"
    t.string   "phone"
    t.integer  "sms_sent"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "persistence_token"
    t.string   "encrypt_password"
  end

end
