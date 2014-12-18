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

ActiveRecord::Schema.define(version: 20141218000632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string "city_name", null: false
  end

  create_table "housing", force: true do |t|
    t.integer "city_id"
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "posts", force: true do |t|
    t.string "post_content", null: false
  end

  create_table "users", force: true do |t|
    t.string "user_name",          null: false
    t.text   "email",              null: false
    t.text   "password_digest",    null: false
    t.string "program",            null: false
    t.string "housing_preference", null: false
    t.string "about_me",           null: false
  end

end
