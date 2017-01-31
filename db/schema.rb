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

ActiveRecord::Schema.define(version: 20170131161320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "year"
    t.integer  "artist_id"
    t.integer  "label_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "format_id"
    t.text     "properties"
    t.index ["artist_id"], name: "index_albums_on_artist_id", using: :btree
    t.index ["label_id"], name: "index_albums_on_label_id", using: :btree
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "crate_entries", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "crate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_crate_entries_on_album_id", using: :btree
    t.index ["crate_id"], name: "index_crate_entries_on_crate_id", using: :btree
  end

  create_table "crates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "format_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["format_id"], name: "index_format_fields_on_format_id", using: :btree
  end

  create_table "formats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "featuring"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id", using: :btree
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "labels"
  add_foreign_key "crate_entries", "albums"
  add_foreign_key "crate_entries", "crates"
  add_foreign_key "format_fields", "formats"
  add_foreign_key "songs", "albums"
end
