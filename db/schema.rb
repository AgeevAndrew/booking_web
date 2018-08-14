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

ActiveRecord::Schema.define(version: 20180814232600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "phone", null: false
    t.string "email"
    t.integer "address_ids", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "title"
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
    t.jsonb "delivery", default: "{}", null: false
    t.jsonb "contact_info", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_ids", default: [], null: false, array: true
  end

# Could not dump table "company_schedules" because of following StandardError
#   Unknown type 'time with time zone' for column 'time_start'

  create_table "devices", force: :cascade do |t|
    t.string "device_type"
    t.text "registration_token"
    t.bigint "company_id"
    t.uuid "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_devices_on_account_id"
    t.index ["company_id"], name: "index_devices_on_company_id"
  end

  create_table "order_products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.uuid "order_id", null: false
    t.integer "qty", default: 1, null: false
    t.string "main_option"
    t.decimal "total_cost", precision: 18, scale: 2, default: "0.0", null: false
    t.jsonb "ingredients"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "order_tokens", force: :cascade do |t|
    t.uuid "order_id", null: false
    t.string "token", limit: 342, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_tokens_on_order_id"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "company_id"
    t.uuid "account_id"
    t.bigint "status_id", null: false
    t.serial "num", null: false
    t.jsonb "address_info", default: {}, null: false
    t.decimal "total_cost", null: false
    t.decimal "delivery_cost", default: "0.0", null: false
    t.boolean "pickup", default: false, null: false
    t.datetime "delivery_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 18, scale: 2, default: "0.0", null: false
    t.string "device"
    t.text "note"
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["status_id"], name: "index_orders_on_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "company_id"
    t.string "title"
    t.string "brief", limit: 140
    t.text "description"
    t.string "photo"
    t.jsonb "main_options", default: [], null: false, array: true
    t.jsonb "additional_info", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.datetime "deleted_at"
    t.index ["category_id", "company_id"], name: "index_products_on_category_id_and_company_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "push_messages", force: :cascade do |t|
    t.bigint "company_id"
    t.string "title"
    t.text "body"
    t.integer "success"
    t.integer "failure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_push_messages_on_company_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", limit: 2, null: false
  end

  create_table "tidings", force: :cascade do |t|
    t.bigint "company_id"
    t.integer "category"
    t.string "title"
    t.text "body"
    t.text "message"
    t.integer "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tidings_on_company_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "company_schedules", "companies"
  add_foreign_key "order_tokens", "orders"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
  add_foreign_key "push_messages", "companies"
  add_foreign_key "users", "companies"
end
