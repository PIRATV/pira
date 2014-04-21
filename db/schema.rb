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

ActiveRecord::Schema.define(version: 20140328122729) do

  create_table "albums", primary_key: "album_id", force: true do |t|
    t.string   "album_name",   default: ""
    t.string   "album_title",  default: ""
    t.string   "album_url",    default: ""
    t.string   "album_image",  default: ""
    t.boolean  "album_status", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["album_status"], name: "index_albums_on_album_status", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "portfolios", force: true do |t|
    t.integer  "album_id",   limit: 2, default: 0
    t.string   "photo_url",            default: ""
    t.string   "video_url",            default: ""
    t.string   "title",                default: ""
    t.boolean  "status",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portfolios", ["album_id"], name: "index_portfolios_on_album_id", using: :btree
  add_index "portfolios", ["status"], name: "index_portfolios_on_status", using: :btree

  create_table "production_categories", force: true do |t|
    t.string   "category"
    t.string   "category_url"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productions", force: true do |t|
    t.text     "text"
    t.boolean  "status"
    t.integer  "production_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
