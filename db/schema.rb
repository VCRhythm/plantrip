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

ActiveRecord::Schema.define(version: 20131211170257) do

  create_table "markets", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.boolean  "credit"
    t.boolean  "cheese"
    t.boolean  "bakedgoods"
    t.boolean  "maple"
    t.boolean  "meat"
    t.boolean  "nursery"
    t.boolean  "nuts"
    t.boolean  "plants"
    t.boolean  "poultry"
    t.boolean  "prepared"
    t.boolean  "soap"
    t.boolean  "trees"
    t.boolean  "wine"
    t.datetime "updatetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "crafts"
    t.boolean  "flowers"
    t.boolean  "eggs"
    t.boolean  "seafood"
    t.string   "herbs"
    t.string   "boolean"
    t.boolean  "fruitsandvegetables"
    t.boolean  "honey"
    t.boolean  "jams"
  end

end
