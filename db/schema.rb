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

ActiveRecord::Schema[7.0].define(version: 2023_10_12_171445) do
  create_table "guests", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string "code"
    t.boolean "confirmed"
    t.string "possible_dates"
    t.integer "operator_id", null: false
    t.integer "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "possible_confirmed_dates"
    t.json "possible_confirmed_datetimes", default: {}
    t.index ["guest_id"], name: "index_invites_on_guest_id"
    t.index ["operator_id"], name: "index_invites_on_operator_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "link"
    t.string "provider"
    t.datetime "date"
    t.integer "operator_id", null: false
    t.integer "guest_id", null: false
    t.integer "invite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_schedules_on_guest_id"
    t.index ["invite_id"], name: "index_schedules_on_invite_id"
    t.index ["operator_id"], name: "index_schedules_on_operator_id"
  end

  add_foreign_key "invites", "guests"
  add_foreign_key "invites", "operators"
  add_foreign_key "schedules", "guests"
  add_foreign_key "schedules", "invites"
  add_foreign_key "schedules", "operators"
end
