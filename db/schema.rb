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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reimbursement_lists", primary_key: "reimbursement_id", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "descr", limit: 100
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "date_submitted", precision: nil
    t.datetime "date_approved", precision: nil
    t.string "status", limit: 20
  end

  create_table "tokens", id: :serial, force: :cascade do |t|
    t.string "token", limit: 150
    t.string "tokentype", limit: 15
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.integer "user_id", null: false
  end

  create_table "users", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.string "user_name", limit: 50, null: false
    t.string "user_type", limit: 10, null: false
    t.string "user_password", limit: 24, null: false
  end

  add_foreign_key "reimbursement_lists", "users", primary_key: "user_id", name: "reimbursement_lists_user_id_fkey"
  add_foreign_key "tokens", "users", primary_key: "user_id", name: "tokens_user_id_fkey"
end
