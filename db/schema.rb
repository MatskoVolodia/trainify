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

ActiveRecord::Schema.define(version: 20170830150809) do

  create_table "cities", force: :cascade do |t|
    t.string "title"
  end

  create_table "configs", force: :cascade do |t|
    t.float    "first_class_price"
    t.float    "second_class_price"
    t.datetime "valid_since"
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "start_id",           null: false
    t.integer  "destination_id",     null: false
    t.datetime "departure_datetime"
    t.datetime "arrival_datetime"
    t.float    "price_coefficient"
  end

  create_table "trains", force: :cascade do |t|
    t.string  "serial_number"
    t.integer "first_class_seats_count"
    t.integer "second_class_seats_count"
  end

end
