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

ActiveRecord::Schema.define(version: 20160423011649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "categories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishing_gears", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "category_id"
    t.uuid     "post_id"
    t.string   "name"
    t.string   "size"
    t.string   "weight"
    t.string   "color"
    t.string   "brand"
    t.string   "model"
    t.string   "unique_description"
    t.string   "production_country_alpha2"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "fishing_gears", ["category_id"], name: "index_fishing_gears_on_category_id", using: :btree
  add_index "fishing_gears", ["post_id"], name: "index_fishing_gears_on_post_id", using: :btree

  create_table "posts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "title"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.decimal  "radius"
    t.string   "type"
    t.datetime "report_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

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

  add_foreign_key "fishing_gears", "categories"
  add_foreign_key "fishing_gears", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "tags", "categories"
end
