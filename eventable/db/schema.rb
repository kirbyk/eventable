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

ActiveRecord::Schema.define(version: 20150929191147) do

  create_table "events", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "event_type",   null: false
    t.string   "app_color"
    t.string   "app_logo"
    t.integer  "organizer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "events", ["event_type"], name: "index_events_on_event_type"
  add_index "events", ["name"], name: "index_events_on_name"

  create_table "organizers", force: :cascade do |t|
    t.string   "password_digest",                 null: false
    t.string   "email",                           null: false
    t.string   "name",                            null: false
    t.boolean  "is_verified",     default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "organizers", ["email"], name: "index_organizers_on_email"
  add_index "organizers", ["name"], name: "index_organizers_on_name"

  create_table "people", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "bio"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prizes", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "event_id",    null: false
    t.string   "description", null: false
    t.datetime "start_time",  null: false
    t.datetime "end_time",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string   "description", null: false
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
