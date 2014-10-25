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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141025165104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "users", id: :uuid, force: true do |t|
    t.string   "facebook_uid", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["facebook_uid"], :name => "index_users_on_facebook_uid", :unique => true, :case_sensitive => false
  end

  create_table "access_tokens", id: :uuid, force: true do |t|
    t.string   "token",      null: false
    t.integer  "expires_in", null: false
    t.uuid     "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], :name => "index_access_tokens_on_token", :unique => true, :case_sensitive => false
    t.index ["user_id"], :name => "fk__access_tokens_user_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_access_tokens_user_id"
  end

end
