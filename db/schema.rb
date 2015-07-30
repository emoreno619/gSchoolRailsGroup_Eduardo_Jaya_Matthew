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

ActiveRecord::Schema.define(version: 20150730215840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foodlocations", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "food_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "foodlocations", ["food_id"], name: "index_foodlocations_on_food_id", using: :btree
  add_index "foodlocations", ["location_id"], name: "index_foodlocations_on_location_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.boolean  "gluten_free"
    t.boolean  "vegan"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.boolean  "is_public"
  end

  create_table "foodusers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "foodusers", ["food_id"], name: "index_foodusers_on_food_id", using: :btree
  add_index "foodusers", ["user_id"], name: "index_foodusers_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.boolean  "gluten_free"
    t.boolean  "vegan"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.boolean  "is_public"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "locationusers", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locationusers", ["location_id"], name: "index_locationusers_on_location_id", using: :btree
  add_index "locationusers", ["user_id"], name: "index_locationusers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "created_stores"
    t.string   "created_foods"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "is_admin"
  end

  add_foreign_key "foodlocations", "foods"
  add_foreign_key "foodlocations", "locations"
  add_foreign_key "foodusers", "foods"
  add_foreign_key "foodusers", "users"
  add_foreign_key "locationusers", "locations"
  add_foreign_key "locationusers", "users"
end
