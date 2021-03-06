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

ActiveRecord::Schema.define(version: 2021_03_25_100906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_recipes", force: :cascade do |t|
    t.string "name"
    t.text "instructions"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "app_name"
    t.bigint "user_id", null: false
    t.index ["app_name", "user_id"], name: "index_app_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_app_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "api_token"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verification_runs", force: :cascade do |t|
    t.string "state"
    t.integer "duration"
    t.datetime "finished_at"
    t.text "output_message"
    t.text "error_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "app_recipe_id", null: false
    t.index ["app_recipe_id"], name: "index_verification_runs_on_app_recipe_id"
  end

  create_table "verification_step_runs", force: :cascade do |t|
    t.text "stdout"
    t.text "stderr"
    t.datetime "finished_at"
    t.integer "duration"
    t.bigint "verification_run_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["verification_run_id"], name: "index_verification_step_runs_on_verification_run_id"
  end

  add_foreign_key "app_recipes", "users"
  add_foreign_key "verification_runs", "app_recipes"
  add_foreign_key "verification_step_runs", "verification_runs"
end
