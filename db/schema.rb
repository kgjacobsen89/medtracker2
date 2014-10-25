# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141001224312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medications", ["name"], name: "index_medications_on_name", unique: true, using: :btree

  create_table "patient_doctors", force: true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patient_doctors", ["doctor_id"], name: "index_patient_doctors_on_doctor_id", using: :btree
  add_index "patient_doctors", ["patient_id"], name: "index_patient_doctors_on_patient_id", using: :btree

  create_table "patient_medications", force: true do |t|
    t.float    "dosage"
    t.string   "dosage_unit"
    t.integer  "periodicity"
    t.string   "periodicity_unit"
    t.integer  "duration"
    t.string   "duration_unit"
    t.boolean  "ongoing"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "instruction"
    t.integer  "patient_id"
    t.integer  "medication_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patient_medications", ["doctor_id"], name: "index_patient_medications_on_doctor_id", using: :btree
  add_index "patient_medications", ["medication_id"], name: "index_patient_medications_on_medication_id", using: :btree
  add_index "patient_medications", ["patient_id"], name: "index_patient_medications_on_patient_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "sex"
    t.date     "date_of_birth"
    t.string   "blood_type"
    t.text     "allergies"
    t.string   "specialty"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
