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

ActiveRecord::Schema.define(version: 2020_10_30_030546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_clients", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_address_clients_on_client_id"
  end

  create_table "address_suppliers", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_address_suppliers_on_supplier_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.string "identification"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_clients", force: :cascade do |t|
    t.string "client_name"
    t.string "email"
    t.string "telephone"
    t.string "cell_phone"
    t.string "description"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_contact_clients_on_client_id"
  end

  create_table "contact_suppliers", force: :cascade do |t|
    t.string "supplier_name"
    t.string "email"
    t.string "telephone"
    t.string "cell_phone"
    t.string "description"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_contact_suppliers_on_supplier_id"
  end

  create_table "product_colors", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_compositions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_sizes", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_type_id", null: false
    t.string "description"
    t.string "reference"
    t.bigint "product_composition_id", null: false
    t.bigint "product_color_id", null: false
    t.bigint "product_size_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "supplier_id", null: false
    t.string "status"
    t.index ["product_color_id"], name: "index_products_on_product_color_id"
    t.index ["product_composition_id"], name: "index_products_on_product_composition_id"
    t.index ["product_size_id"], name: "index_products_on_product_size_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "stock_adjustments", force: :cascade do |t|
    t.string "reason"
    t.date "date_adjustment"
    t.bigint "stock_id", null: false
    t.integer "quantity"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_stock_adjustments_on_stock_id"
  end

  create_table "stock_entries", force: :cascade do |t|
    t.date "date_invoice"
    t.string "invoice"
    t.bigint "stock_id", null: false
    t.integer "quantity"
    t.decimal "unit_price"
    t.date "date_entry"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_stock_entries_on_stock_id"
  end

  create_table "stock_outs", force: :cascade do |t|
    t.string "order_number"
    t.bigint "client_id", null: false
    t.string "date_out"
    t.bigint "stock_id", null: false
    t.integer "quantity"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_stock_outs_on_client_id"
    t.index ["stock_id"], name: "index_stock_outs_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "minimum_quantity"
    t.integer "quantity"
    t.decimal "last_unit_price"
    t.string "description"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supplier_name"
    t.string "identification"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "address_clients", "clients"
  add_foreign_key "address_suppliers", "suppliers"
  add_foreign_key "contact_clients", "clients"
  add_foreign_key "contact_suppliers", "suppliers"
  add_foreign_key "products", "product_colors"
  add_foreign_key "products", "product_compositions"
  add_foreign_key "products", "product_sizes"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "suppliers"
  add_foreign_key "stock_adjustments", "stocks"
  add_foreign_key "stock_entries", "stocks"
  add_foreign_key "stock_outs", "clients"
  add_foreign_key "stock_outs", "stocks"
  add_foreign_key "stocks", "products"
end
