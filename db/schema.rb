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

ActiveRecord::Schema.define(version: 2020_07_30_093732) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "company_name"
    t.string "company_name_furigana"
    t.bigint "payment_method_id"
    t.integer "receipt_required", default: 0, null: false
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

  create_table "customer_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "tag_name"
    t.string "tag_type"
    t.string "tag_position"
    t.integer "brand_name_tag_cut"
    t.integer "composition_tag_cut"
    t.bigint "tag_sewing_method_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_tags_on_customer_id"
    t.index ["tag_sewing_method_id"], name: "index_customer_tags_on_tag_sewing_method_id"
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

  create_table "factories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "factory_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "individual_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "payment_method_id"
    t.integer "receipt_required", default: 0, null: false
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

  create_table "payment_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "payment_method_name"
    t.string "payment_condition"
    t.integer "invoice_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "position_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "tag_note"
    t.bigint "customer_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_tag_id"], name: "index_tag_notes_on_customer_tag_id"
  end

  create_table "tag_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "tag_photo"
    t.bigint "customer_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_tag_id"], name: "index_tag_photos_on_customer_tag_id"
  end

  create_table "tag_sewing_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "tag_sewing_method_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "tag_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_sizes_quantities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_tag_id"
    t.bigint "tag_size_id"
    t.integer "tag_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_tag_id"], name: "index_tag_sizes_quantities_on_customer_tag_id"
    t.index ["tag_size_id"], name: "index_tag_sizes_quantities_on_tag_size_id"
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
  add_foreign_key "customer_emails", "customers"
  add_foreign_key "customer_notes", "customers"
  add_foreign_key "customer_phone_numbers", "customers"
  add_foreign_key "customer_tags", "customers"
  add_foreign_key "customer_tags", "tag_sewing_methods"
  add_foreign_key "customers", "customer_types"
  add_foreign_key "individual_customers", "customers"
  add_foreign_key "individual_customers", "payment_methods"
  add_foreign_key "invoicing_departments", "departments"
  add_foreign_key "invoicing_departments", "payment_methods"
  add_foreign_key "tag_notes", "customer_tags"
  add_foreign_key "tag_photos", "customer_tags"
  add_foreign_key "tag_sizes_quantities", "customer_tags"
  add_foreign_key "tag_sizes_quantities", "tag_sizes"
  add_foreign_key "users_departments", "departments"
  add_foreign_key "users_departments", "positions"
  add_foreign_key "users_departments", "users"
  add_foreign_key "users_factories", "factories"
  add_foreign_key "users_factories", "users"
end
