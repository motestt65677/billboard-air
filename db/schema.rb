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

ActiveRecord::Schema.define(version: 20180404091632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "bids", force: :cascade do |t|
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "timeslot_id"
    t.index ["timeslot_id"], name: "index_bids_on_timeslot_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.float "current_price"
    t.string "description"
    t.string "location"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "board_id"
    t.bigint "user_id"
    t.index ["board_id"], name: "index_reviews_on_board_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.float "current_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "board_id"
    t.string "status"
    t.date "auction_start"
    t.date "auction_end"
    t.index ["board_id"], name: "index_timeslots_on_board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "bids", "timeslots"
  add_foreign_key "bids", "users"
  add_foreign_key "boards", "users"
  add_foreign_key "reviews", "boards"
  add_foreign_key "reviews", "users"
  add_foreign_key "timeslots", "boards"
end
