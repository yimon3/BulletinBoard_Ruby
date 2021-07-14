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

ActiveRecord::Schema.define(version: 2021_07_12_082334) do

  create_table "posts", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.integer "status", default: 1, null: false
    t.integer "create_user_id", null: false
    t.integer "updated_user_id", null: false
    t.integer "deleted_user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["create_user_id"], name: "create_user_id"
    t.index ["title"], name: "title", unique: true
    t.index ["updated_user_id"], name: "updated_user_id"
  end

  create_table "users", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "password", null: false
    t.string "profile", null: false
    t.string "user_type", limit: 1, default: "1", null: false
    t.string "phone"
    t.string "address"
    t.date "dob"
    t.integer "create_user_id", null: false
    t.integer "updated_user_id", null: false
    t.integer "deleted_user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "email", unique: true
    t.index ["name"], name: "name", unique: true
  end

  add_foreign_key "posts", "users", column: "create_user_id", name: "create_user_id"
  add_foreign_key "posts", "users", column: "updated_user_id", name: "updated_user_id"
end
