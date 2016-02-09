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

ActiveRecord::Schema.define(version: 20160123175024) do

  create_table "acordes", force: true do |t|
    t.integer  "cantante_id"
    t.string   "nombre"
    t.string   "acorde"
    t.string   "descripcion"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acordes", ["album_id"], name: "index_acordes_on_album_id"
  add_index "acordes", ["cantante_id"], name: "index_acordes_on_cantante_id"

  create_table "albums", force: true do |t|
    t.string   "nombre"
    t.string   "year"
    t.integer  "cantante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["cantante_id"], name: "index_albums_on_cantante_id"

  create_table "cantantes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
