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

ActiveRecord::Schema.define(version: 20160103183533) do

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "drafted_by"
    t.string   "reviewed_by"
    t.string   "published_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "serially_task_runs", force: :cascade do |t|
    t.string   "item_class",                 null: false
    t.string   "item_id",                    null: false
    t.string   "task_name",                  null: false
    t.integer  "task_order",                 null: false
    t.integer  "status",         default: 0
    t.datetime "finished_at"
    t.text     "result_message"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "serially_task_runs", ["item_class", "item_id"], name: "index_serially_task_runs_on_item_class_and_item_id"

end
