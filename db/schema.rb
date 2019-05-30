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

ActiveRecord::Schema.define(version: 2019_05_29_202756) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "baskets", force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.float "total_price"
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customerbalances", force: :cascade do |t|
    t.float "total_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_customerbalances_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.integer "user_id"
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "faultreqs", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "key"
    t.index ["user_id"], name: "index_faultreqs_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "req_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brand_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "reqitems", force: :cascade do |t|
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.integer "order_id"
    t.index ["order_id"], name: "index_reqitems_on_order_id"
    t.index ["product_id"], name: "index_reqitems_on_product_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "product_id"
    t.index ["product_id"], name: "index_requests_on_product_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "salesproducts", force: :cascade do |t|
    t.integer "unit"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.integer "user_id"
    t.integer "basket_id"
    t.index ["basket_id"], name: "index_salesproducts_on_basket_id"
    t.index ["product_id"], name: "index_salesproducts_on_product_id"
    t.index ["user_id"], name: "index_salesproducts_on_user_id"
  end

  create_table "technicalsupports", force: :cascade do |t|
    t.float "workmanship_price"
    t.float "total_price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.integer "user_id"
    t.index ["user_id"], name: "index_technicalsupports_on_user_id"
  end

  create_table "tecnichsales", force: :cascade do |t|
    t.integer "unit"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "technicalsupport_id"
    t.integer "product_id"
    t.index ["product_id"], name: "index_tecnichsales_on_product_id"
    t.index ["technicalsupport_id"], name: "index_tecnichsales_on_technicalsupport_id"
    t.index ["user_id"], name: "index_tecnichsales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.boolean "admin"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
