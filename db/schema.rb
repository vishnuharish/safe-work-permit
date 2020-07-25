# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_25_112902) do

  create_table "safe_works", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "company_id"
    t.string "company_name"
    t.integer "crew_size"
    t.boolean "is_snv_lavalin"
    t.boolean "is_sub_contractor"
    t.datetime "issued_datetime"
    t.datetime "expired_datetime"
    t.datetime "extended_datetime"
    t.integer "extended_by"
    t.text "emergency_meeting_point"
    t.text "location"
    t.text "description_of_work"
    t.integer "approved_by"
    t.datetime "approved_datetime"
    t.integer "created_by"
    t.datetime "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_approved"
    t.boolean "is_rejected"
    t.text "comments"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "manager_id"
  end

end
