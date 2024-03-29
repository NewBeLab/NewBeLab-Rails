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

ActiveRecord::Schema.define(version: 2023_01_14_012107) do

  create_table "profile_tags", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id", "tag_id"], name: "index_profile_tags_on_profile_id_and_tag_id", unique: true
    t.index ["profile_id"], name: "index_profile_tags_on_profile_id"
    t.index ["tag_id"], name: "index_profile_tags_on_tag_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "times_link"
    t.string "commitment"
    t.string "position"
    t.string "motivation"
    t.text "self_introduction"
    t.string "phase"
    t.integer "grade"
    t.string "editor"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "times_link"], name: "index_profiles_on_user_id_and_times_link", unique: true
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "profile_tags", "profiles"
  add_foreign_key "profile_tags", "tags"
  add_foreign_key "profiles", "users"
end
