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

ActiveRecord::Schema.define(version: 2018_05_04_183308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "policy_manager_portability_requests", force: :cascade do |t|
    t.integer "user_id"
    t.string "state"
    t.string "attachment"
    t.string "attachment_file_name"
    t.string "attachment_file_size"
    t.datetime "attachment_content_type"
    t.string "attachment_file_content_type"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_policy_manager_portability_requests_on_user_id"
  end

  create_table "policy_manager_terms", force: :cascade do |t|
    t.text "description"
    t.string "rule"
    t.string "state"
    t.datetime "accepted_at"
    t.datetime "rejected_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policy_manager_user_terms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "term_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_policy_manager_user_terms_on_state"
    t.index ["term_id"], name: "index_policy_manager_user_terms_on_term_id"
    t.index ["user_id"], name: "index_policy_manager_user_terms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
