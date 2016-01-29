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

ActiveRecord::Schema.define(version: 20160129004007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.boolean  "swapped"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "first_swipe_id"
    t.integer  "second_swipe_id"
    t.datetime "swapped_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "matches", ["first_swipe_id"], name: "index_matches_on_first_swipe_id", using: :btree
  add_index "matches", ["second_swipe_id"], name: "index_matches_on_second_swipe_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["match_id"], name: "index_messages_on_match_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "swipes", force: :cascade do |t|
    t.integer  "owned_item_id"
    t.integer  "judged_item_id"
    t.boolean  "direction_like"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "swipes", ["judged_item_id"], name: "index_swipes_on_judged_item_id", using: :btree
  add_index "swipes", ["owned_item_id"], name: "index_swipes_on_owned_item_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
