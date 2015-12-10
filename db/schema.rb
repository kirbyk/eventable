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

ActiveRecord::Schema.define(version: 20151210195223) do

  create_table "events", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "event_type",   null: false
    t.string   "app_logo"
    t.integer  "organizer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "app_fgcolor"
    t.string   "app_bgcolor"
    t.string   "ionic_id"
  end

  add_index "events", ["event_type"], name: "index_events_on_event_type"
  add_index "events", ["name"], name: "index_events_on_name"

  create_table "organizers", force: :cascade do |t|
    t.string   "name",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "organizers", ["email"], name: "index_organizers_on_email", unique: true
  add_index "organizers", ["name"], name: "index_organizers_on_name"
  add_index "organizers", ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true

  create_table "people", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "company"
    t.string   "skills"
  end

  create_table "prizes", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "company"
    t.string   "description"
    t.string   "award"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "event_id",    null: false
    t.string   "description", null: false
    t.datetime "start_time",  null: false
    t.datetime "end_time",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
  end

  create_table "updates", force: :cascade do |t|
    t.string   "description", null: false
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
  end

end
