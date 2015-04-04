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

ActiveRecord::Schema.define(version: 20150403061904) do

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.integer  "h1b",        default: 0
    t.integer  "h1r",        default: 0
    t.integer  "h2b",        default: 0
    t.integer  "h2r",        default: 0
    t.integer  "h3b",        default: 0
    t.integer  "h3r",        default: 0
    t.integer  "hg3b",       default: 0
    t.integer  "hg3r",       default: 0
    t.integer  "d1b",        default: 0
    t.integer  "d1r",        default: 0
    t.integer  "d2b",        default: 0
    t.integer  "d2r",        default: 0
    t.integer  "d3b",        default: 0
    t.integer  "d3r",        default: 0
    t.integer  "dg3b",       default: 0
    t.integer  "dg3r",       default: 0
    t.integer  "total",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "headline",    limit: 500
    t.text     "url"
    t.integer  "ready"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_keywords", force: true do |t|
    t.integer  "keyword_id"
    t.integer  "news_id"
    t.integer  "head_count",            default: 0
    t.string   "keyword_head_position", default: "-1"
    t.integer  "desc_count",            default: 0
    t.string   "keyword_desc_position", default: "-1"
    t.integer  "ready"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
