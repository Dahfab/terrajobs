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

ActiveRecord::Schema.define(version: 2018_10_31_220318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "mail"
    t.string "facebook_url"
    t.string "twitter_url"
    t.decimal "company_lat", precision: 10, scale: 6
    t.decimal "company_long", precision: 10, scale: 6
    t.bigint "jobs_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jobs_id"], name: "index_companies_on_jobs_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "position"
    t.text "description"
    t.text "responsibilities"
    t.text "requirements"
    t.text "offers"
    t.text "how_to_apply"
    t.string "apply_url"
    t.string "apply_mail"
    t.bigint "companies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["companies_id"], name: "index_jobs_on_companies_id"
  end

end
