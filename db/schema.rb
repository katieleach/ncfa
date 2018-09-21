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

ActiveRecord::Schema.define(version: 2018_09_21_134537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assets_drivers", id: false, force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.bigint "driver_id", null: false
    t.index ["asset_id", "driver_id"], name: "index_assets_drivers_on_asset_id_and_driver_id"
    t.index ["driver_id", "asset_id"], name: "index_assets_drivers_on_driver_id_and_asset_id"
  end

  create_table "assets_drivers_joins", force: :cascade do |t|
    t.bigint "asset_id"
    t.bigint "driver_id"
    t.string "influence"
    t.text "justification"
    t.text "likely_response"
    t.text "effect_on_variability"
    t.string "human_action_or_natural_variation"
    t.string "timescale"
    t.string "spatial_characteristics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_assets_drivers_joins_on_asset_id"
    t.index ["driver_id"], name: "index_assets_drivers_joins_on_driver_id"
  end

  create_table "assets_ecosystem_services", id: false, force: :cascade do |t|
    t.bigint "ecosystem_service_id", null: false
    t.bigint "asset_id", null: false
    t.index ["asset_id", "ecosystem_service_id"], name: "idx__asset_ecosystem_service"
    t.index ["ecosystem_service_id", "asset_id"], name: "idx_ecosystem_service_asset"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecosystem_services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecosystem_services_assets_joins", force: :cascade do |t|
    t.bigint "ecosystem_service_id"
    t.bigint "asset_id"
    t.string "importance"
    t.text "justification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_ecosystem_services_assets_joins_on_asset_id"
    t.index ["ecosystem_service_id"], name: "index_ecosystem_services_assets_joins_on_ecosystem_service_id"
  end

  create_table "materialities", force: :cascade do |t|
    t.string "rag"
    t.text "justification"
    t.bigint "production_process_id"
    t.bigint "ecosystem_services_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ecosystem_services_id"], name: "index_materialities_on_ecosystem_services_id"
    t.index ["production_process_id"], name: "index_materialities_on_production_process_id"
  end

  create_table "production_processes", force: :cascade do |t|
    t.string "name"
    t.bigint "sub_industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_industry_id"], name: "index_production_processes_on_sub_industry_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_industries", force: :cascade do |t|
    t.string "name"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_sub_industries_on_sector_id"
  end

  add_foreign_key "assets_drivers_joins", "assets"
  add_foreign_key "assets_drivers_joins", "drivers"
  add_foreign_key "ecosystem_services_assets_joins", "assets"
  add_foreign_key "ecosystem_services_assets_joins", "ecosystem_services"
  add_foreign_key "materialities", "ecosystem_services", column: "ecosystem_services_id"
  add_foreign_key "materialities", "production_processes"
  add_foreign_key "production_processes", "sub_industries"
  add_foreign_key "sub_industries", "sectors"
end
