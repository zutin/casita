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

ActiveRecord::Schema[8.1].define(version: 2026_08_14_010147) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "city", limit: 100, null: false
    t.datetime "created_at", null: false
    t.integer "deal_kind", default: 0, null: false
    t.string "district", limit: 100, null: false
    t.integer "kind", default: 0, null: false
    t.boolean "negotiable", default: false, null: false
    t.bigint "rent_value_cents", default: 0
    t.bigint "sale_value_cents", default: 0
    t.string "state", limit: 2, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "zip_code", limit: 10, null: false
    t.index ["city"], name: "index_properties_on_city"
    t.index ["deal_kind"], name: "index_properties_on_deal_kind"
    t.index ["district"], name: "index_properties_on_district"
    t.index ["kind"], name: "index_properties_on_kind"
    t.index ["state"], name: "index_properties_on_state"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "users"
end
