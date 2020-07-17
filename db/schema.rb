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

ActiveRecord::Schema.define(version: 2020_07_17_020738) do

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.datetime "ordered_date"
    t.datetime "responsed_date"
    t.string "contact_person"
    t.string "states"
    t.string "silk_screen_a"
    t.string "silk_screen_b"
    t.string "silk_screen_c"
    t.string "inkjet"
    t.string "embroidery"
    t.string "sewing"
    t.string "uv"
    t.string "silk_screen_d"
    t.string "option_a"
    t.string "option_b"
    t.string "delivery_address"
    t.datetime "desired_delivery_date"
    t.datetime "internal_delivery_date"
    t.datetime "payment_date"
    t.integer "amount_paid"
    t.string "location_name"
    t.string "purchase_domestic_products"
    t.string "purchase_oversea_products"
    t.string "sorting"
    t.string "order_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
