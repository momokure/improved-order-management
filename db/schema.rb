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

ActiveRecord::Schema.define(version: 2020_08_08_120156) do

  create_table "buy_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "buy_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "company_name"
    t.string "company_name_furigana"
    t.bigint "payment_method_id"
    t.boolean "receipt_required", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_method_id"], name: "index_companies_on_payment_method_id"
  end

  create_table "company_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_customers_on_company_id"
    t.index ["customer_id"], name: "index_company_customers_on_customer_id"
  end

  create_table "company_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "company_note"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_notes_on_company_id"
  end

  create_table "customer_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "prefecture_code"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_addresses_on_customer_id"
    t.index ["prefecture_code"], name: "index_customer_addresses_on_prefecture_code"
  end

  create_table "customer_emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "customer_email"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_emails_on_customer_id"
  end

  create_table "customer_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "customer_note"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_notes_on_customer_id"
  end

  create_table "customer_phone_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "customer_phone_number"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_phone_numbers_on_customer_id"
  end

  create_table "customer_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "customer_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_furigana"
    t.bigint "customer_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_type_id"], name: "index_customers_on_customer_type_id"
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "department_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "desired_delivery_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "desired_delivery_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "factory_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "individual_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "payment_method_id"
    t.boolean "receipt_required", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_individual_customers_on_customer_id"
    t.index ["payment_method_id"], name: "index_individual_customers_on_payment_method_id"
  end

  create_table "invoicing_departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "payment_method_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_invoicing_departments_on_department_id"
    t.index ["payment_method_id"], name: "index_invoicing_departments_on_payment_method_id"
  end

  create_table "order_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "customer_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_address_id"], name: "index_order_addresses_on_customer_address_id"
    t.index ["order_id"], name: "index_order_addresses_on_order_id"
  end

  create_table "order_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.boolean "mixed_techniques", default: false, null: false
    t.boolean "large_order", default: false, null: false
    t.bigint "factory_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_id"], name: "index_order_details_on_factory_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "order_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "order_note"
    t.bigint "order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_notes_on_order_id"
    t.index ["user_id"], name: "index_order_notes_on_user_id"
  end

  create_table "order_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "order_option_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_technique_detail_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "order_detail_id"
    t.bigint "technique_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_detail_id"], name: "index_order_technique_detail_options_on_order_detail_id"
    t.index ["technique_option_id"], name: "index_order_technique_detail_options_on_technique_option_id"
  end

  create_table "order_technique_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "order_detail_id"
    t.bigint "technique_id"
    t.bigint "progress_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_detail_id"], name: "index_order_technique_details_on_order_detail_id"
    t.index ["progress_id"], name: "index_order_technique_details_on_progress_id"
    t.index ["technique_id"], name: "index_order_technique_details_on_technique_id"
  end

  create_table "order_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "order_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "order_reflect_user_id"
    t.bigint "csr_user_id"
    t.bigint "order_type_id"
    t.bigint "quote_difficulty_level_id"
    t.bigint "payment_method_id"
    t.datetime "order_date"
    t.datetime "first_response_date"
    t.datetime "desired_delivery_date"
    t.bigint "desired_delivery_type_id"
    t.datetime "internal_delivery_date"
    t.bigint "specified_time_id"
    t.boolean "domestic_buying", default: true, null: false
    t.boolean "overseas_buying", default: false, null: false
    t.boolean "carry_in", default: false, null: false
    t.datetime "payment_deadline_date"
    t.integer "payment_amount"
    t.boolean "payment_confirmation", default: false, null: false
    t.boolean "send_receipt", default: false, null: false
    t.boolean "send_invoice", default: false, null: false
    t.boolean "shipment_status", default: false, null: false
    t.datetime "shipment_date"
    t.bigint "shipment_user_id"
    t.integer "cancellation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["csr_user_id"], name: "index_orders_on_csr_user_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["desired_delivery_type_id"], name: "index_orders_on_desired_delivery_type_id"
    t.index ["order_reflect_user_id"], name: "index_orders_on_order_reflect_user_id"
    t.index ["order_type_id"], name: "index_orders_on_order_type_id"
    t.index ["payment_method_id"], name: "index_orders_on_payment_method_id"
    t.index ["quote_difficulty_level_id"], name: "index_orders_on_quote_difficulty_level_id"
    t.index ["shipment_user_id"], name: "index_orders_on_shipment_user_id"
    t.index ["specified_time_id"], name: "index_orders_on_specified_time_id"
  end

  create_table "payment_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "payment_method_name"
    t.string "payment_condition"
    t.boolean "invoice_required", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "position_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "progress_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_difficulty_levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "quote_difficulty_level_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specified_times", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "specified_time_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "supplier_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technique_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "technique_option_name"
    t.bigint "technique_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technique_id"], name: "index_technique_options_on_technique_id"
  end

  create_table "techniques", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "technique_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "department_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_users_departments_on_department_id"
    t.index ["position_id"], name: "index_users_departments_on_position_id"
    t.index ["user_id"], name: "index_users_departments_on_user_id"
  end

  create_table "users_factories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "factory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_id"], name: "index_users_factories_on_factory_id"
    t.index ["user_id"], name: "index_users_factories_on_user_id"
  end

  add_foreign_key "companies", "payment_methods"
  add_foreign_key "company_customers", "companies"
  add_foreign_key "company_customers", "customers"
  add_foreign_key "company_notes", "companies"
  add_foreign_key "customer_addresses", "customers"
  add_foreign_key "customer_emails", "customers"
  add_foreign_key "customer_notes", "customers"
  add_foreign_key "customer_phone_numbers", "customers"
  add_foreign_key "customers", "customer_types"
  add_foreign_key "individual_customers", "customers"
  add_foreign_key "individual_customers", "payment_methods"
  add_foreign_key "invoicing_departments", "departments"
  add_foreign_key "invoicing_departments", "payment_methods"
  add_foreign_key "order_addresses", "customer_addresses"
  add_foreign_key "order_addresses", "orders"
  add_foreign_key "order_details", "factories"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_notes", "orders"
  add_foreign_key "order_notes", "users"
  add_foreign_key "order_technique_detail_options", "order_details"
  add_foreign_key "order_technique_detail_options", "technique_options"
  add_foreign_key "order_technique_details", "order_details"
  add_foreign_key "order_technique_details", "progresses"
  add_foreign_key "order_technique_details", "techniques"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "desired_delivery_types"
  add_foreign_key "orders", "order_types"
  add_foreign_key "orders", "payment_methods"
  add_foreign_key "orders", "quote_difficulty_levels"
  add_foreign_key "orders", "specified_times"
  add_foreign_key "orders", "users", column: "csr_user_id"
  add_foreign_key "orders", "users", column: "order_reflect_user_id"
  add_foreign_key "orders", "users", column: "shipment_user_id"
  add_foreign_key "technique_options", "techniques"
  add_foreign_key "users_departments", "departments"
  add_foreign_key "users_departments", "positions"
  add_foreign_key "users_departments", "users"
  add_foreign_key "users_factories", "factories"
  add_foreign_key "users_factories", "users"
end
