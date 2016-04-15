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

ActiveRecord::Schema.define(version: 20160415204613) do

  create_table "brag_likes", force: :cascade do |t|
    t.string   "email"
    t.integer  "brag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brags", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "clicks", force: :cascade do |t|
    t.string   "path"
    t.text     "params"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_responses", force: :cascade do |t|
    t.string   "email"
    t.string   "event_id"
    t.string   "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "time"
    t.string   "organizer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "location"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "position"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "post_response_likes", force: :cascade do |t|
    t.integer  "post_response_id"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "post_responses", force: :cascade do |t|
    t.string   "author"
    t.integer  "post_id"
    t.text     "body"
    t.string   "response_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
