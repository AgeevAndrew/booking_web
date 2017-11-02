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

ActiveRecord::Schema.define(version: 20171030230618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"
  enable_extension "postgis"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_ids", default: [], null: false, array: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "title", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "house", null: false
    t.string "office"
    t.string "entrance"
    t.string "floor"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon_type", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "categories", default: [], null: false, array: true
    t.text "description"
    t.jsonb "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.string "main_option"
    t.decimal "total_cost", precision: 18, scale: 2, default: "0.0", null: false
    t.jsonb "ingredients"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "account_id"
    t.decimal "total_cost"
    t.string "address_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["company_id"], name: "index_orders_on_company_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "company_id"
    t.string "title"
    t.text "description"
    t.string "photo"
    t.jsonb "main_options", default: [], null: false, array: true
    t.jsonb "additional_info", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brief", limit: 140
    t.index ["category_id", "company_id"], name: "index_products_on_category_id_and_company_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
end
