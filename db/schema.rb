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

ActiveRecord::Schema.define(version: 20141110174847) do

  create_table "donators", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "hours"
    t.text     "description"
    t.string   "logo_link"
    t.string   "donation"
    t.boolean  "current",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "inventories", force: true do |t|
    t.string   "name"
    t.string   "pref_size"
    t.boolean  "running_low", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "links", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",              default: false
    t.boolean  "approved",           default: false
    t.text     "availability_notes"
  end

end