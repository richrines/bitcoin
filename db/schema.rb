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

ActiveRecord::Schema.define(version: 20140114064233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bitcoin_prices", force: true do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "avg",                                    null: false
    t.float    "buy",                                    null: false
    t.float    "high",                                   null: false
    t.float    "last",                                   null: false
    t.float    "low",                                    null: false
    t.float    "vol",                                    null: false
    t.float    "vol_cur",                                null: false
    t.float    "five_period"
    t.float    "first_derivative_five"
    t.float    "second_derivative_five"
    t.float    "spread",                                 null: false
    t.float    "ten_period"
    t.float    "first_derivative_ten"
    t.float    "second_derivative_ten"
    t.integer  "server_time",                            null: false
    t.boolean  "email_sent",             default: false, null: false
    t.string   "email_type"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

end
