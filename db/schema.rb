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

ActiveRecord::Schema.define(version: 20160423034447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "addressable_id"
    t.string   "addressable_type"
    t.string   "kind"
    t.boolean  "is_default",       default: true, null: false
    t.string   "line_1"
    t.string   "line_2"
    t.string   "line_3"
    t.string   "postal_code"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "categories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishing_gear_tags", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "fishing_gear_id"
    t.uuid     "tag_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "fishing_gear_tags", ["fishing_gear_id"], name: "index_fishing_gear_tags_on_fishing_gear_id", using: :btree
  add_index "fishing_gear_tags", ["tag_id"], name: "index_fishing_gear_tags_on_tag_id", using: :btree

  create_table "fishing_gears", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "category_id"
    t.uuid     "post_id"
    t.integer  "category_code"
    t.string   "name"
    t.string   "mesh_size"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "weight"
    t.string   "color"
    t.text     "comment"
    t.string   "production_country_alpha2"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "fishing_gears", ["category_id"], name: "index_fishing_gears_on_category_id", using: :btree
  add_index "fishing_gears", ["post_id"], name: "index_fishing_gears_on_post_id", using: :btree

  create_table "posts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.boolean  "is_complete"
    t.string   "title"
    t.text     "address"
    t.float    "longitude"
    t.float    "latitude"
    t.decimal  "radius"
    t.string   "type"
    t.string   "incentive"
    t.datetime "report_date"
    t.uuid     "founder_id"
    t.datetime "found_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "sessions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "tags", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "category_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tags", ["category_id"], name: "index_tags_on_category_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile_phone"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.boolean  "is_active",             default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "fishing_gear_tags", "fishing_gears"
  add_foreign_key "fishing_gear_tags", "tags"
  add_foreign_key "fishing_gears", "categories"
  add_foreign_key "fishing_gears", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "tags", "categories"
end
