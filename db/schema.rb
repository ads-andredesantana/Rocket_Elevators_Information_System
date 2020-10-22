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

ActiveRecord::Schema.define(version: 2020_10_22_010308) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_of_address"
    t.string "status"
    t.string "entity"
    t.string "number_street"
    t.string "suite_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id"
    t.string "type"
    t.string "status"
    t.bigint "employee_id"
    t.datetime "date_of_commissioning"
    t.datetime "date_of_last_inspection"
    t.string "certificate_of_operations"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "full_name_of_building_administrator"
    t.string "email_of_building_administrator"
    t.integer "phone_of_building_administrator"
    t.string "full_name_technical_contact"
    t.string "technical_contact_email"
    t.integer "technical_contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battery_id"
    t.string "type"
    t.integer "number_of_floors_served"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.string "company_name"
    t.bigint "address_id"
    t.string "full_name_of_contact"
    t.integer "company_phone"
    t.string "email_of_contact"
    t.string "full_name_of_service_authority"
    t.integer "technical_authority_phone"
    t.string "technical_authority_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["users_id"], name: "index_customers_on_users_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "column_id"
    t.integer "serial_number"
    t.string "model"
    t.string "type"
    t.string "status"
    t.datetime "date_of_commissioning"
    t.datetime "date_of_last_inspection"
    t.string "certificate_of_inspection"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.string "lastname"
    t.string "firstname"
    t.string "title_function"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_employees_on_users_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "company_name"
    t.string "phone"
    t.string "project_name"
    t.string "project_description"
    t.string "department_in_charge_of_elevators"
    t.string "message"
    t.binary "attached_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fullName"
    t.string "email"
    t.string "phone"
    t.string "businessname"
    t.string "projectname"
    t.string "buildingtype"
    t.string "quality"
    t.integer "nbapartment"
    t.integer "nbfloor"
    t.integer "nbbasement"
    t.integer "nbbusiness"
    t.integer "nbparking"
    t.integer "nbshaft"
    t.integer "nboccupant"
    t.integer "nbcompanies"
    t.integer "activehours"
    t.integer "nbelevator"
    t.string "elevatorprice"
    t.string "subtotal"
    t.string "installfee"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "authentication_token", limit: 30
    t.boolean "admin"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users", column: "users_id"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users", column: "users_id"
end
