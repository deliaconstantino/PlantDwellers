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

ActiveRecord::Schema.define(version: 20210204164701) do

  create_table "dwellers", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "username"
    t.string  "password_digest"
    t.string  "favorite_plant"
    t.integer "home_id"
  end

  create_table "homes", force: :cascade do |t|
    t.integer "hardiness_zone"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "common_name"
    t.string   "scientific_name"
    t.string   "watering_schedule"
    t.string   "rotation_schedule"
    t.string   "fertilization_schedule"
    t.string   "location"
    t.string   "size"
    t.string   "category"
    t.integer  "dweller_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
