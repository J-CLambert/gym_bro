# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_31_095105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "price"
    t.date "start_at"
    t.time "duration"
    t.bigint "user_id", null: false
    t.bigint "gym_id", null: false
    t.date "traning_started_at"
    t.date "traning_ended_at"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_bookings_on_gym_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "priceph", precision: 5, scale: 2
    t.bigint "user_id", null: false
    t.string "title"
    t.index ["user_id"], name: "index_gyms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "owner", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "gyms"
  add_foreign_key "bookings", "users"
  add_foreign_key "gyms", "users"
end
