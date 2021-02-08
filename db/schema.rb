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

ActiveRecord::Schema.define(version: 2021_02_05_093918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_recipes", force: :cascade do |t|
    t.string "title"
    t.text "instructions"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "verification_runs", force: :cascade do |t|
    t.string "status"
    t.integer "duration"
    t.datetime "finished_at"
    t.text "output_message"
    t.text "error_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "app_recipe_id", null: false
    t.index ["app_recipe_id"], name: "index_verification_runs_on_app_recipe_id"
  end

  add_foreign_key "verification_runs", "app_recipes"
end
