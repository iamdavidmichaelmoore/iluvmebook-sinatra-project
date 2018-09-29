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

ActiveRecord::Schema.define(version: 20180929162645) do

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.string   "issue_date"
    t.string   "issuing_command_unit"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "books", force: :cascade do |t|
    t.string  "book_name"
    t.string  "unit_name"
    t.string  "security_clearance_level"
    t.string  "firstline_supervisor_name"
    t.string  "firstline_supervisor_email"
    t.string  "firstline_supervisor_phone"
    t.string  "commander_name"
    t.string  "commander_email"
    t.string  "commander_phone"
    t.integer "service_member_id"
    t.integer "branch_id"
    t.integer "award_id"
    t.string  "current_rank"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
  end

  create_table "service_members", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "first_name"
    t.text     "last_name"
  end

end
