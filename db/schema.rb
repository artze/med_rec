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

ActiveRecord::Schema.define(version: 20170313034057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "specialization"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_doctors_on_user_id", using: :btree
  end

  create_table "medical_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_records", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.integer  "medical_condition_id"
    t.integer  "medical_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["doctor_id"], name: "index_medical_records_on_doctor_id", using: :btree
    t.index ["medical_category_id"], name: "index_medical_records_on_medical_category_id", using: :btree
    t.index ["medical_condition_id"], name: "index_medical_records_on_medical_condition_id", using: :btree
    t.index ["patient_id"], name: "index_medical_records_on_patient_id", using: :btree
  end

  create_table "medications", force: :cascade do |t|
    t.string   "name"
    t.string   "dosage"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "medical_record_id"
    t.index ["medical_record_id"], name: "index_medications_on_medical_record_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "DOB"
    t.index ["user_id"], name: "index_patients_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "full_name"
    t.string   "identity_card"
    t.string   "street_address"
    t.string   "postcode"
    t.string   "city"
    t.string   "country"
    t.string   "contact_number"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "doctors", "users"
  add_foreign_key "medical_records", "doctors"
  add_foreign_key "medical_records", "medical_categories"
  add_foreign_key "medical_records", "medical_conditions"
  add_foreign_key "medical_records", "patients"
  add_foreign_key "medications", "medical_records"
  add_foreign_key "patients", "users"
end
