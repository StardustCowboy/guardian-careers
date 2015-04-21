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

ActiveRecord::Schema.define(version: 20150329230454) do

  create_table "accounts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "resume"
    t.string   "transcript"
    t.string   "address"
    t.string   "experience"
    t.string   "email"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude",   limit: 24
    t.float    "latitude",    limit: 24
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "job_applications", force: true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "cover_letter"
    t.integer  "account_id"
    t.string   "license"
  end

  add_index "job_applications", ["account_id"], name: "index_job_applications_on_account_id", using: :btree
  add_index "job_applications", ["user_id", "job_id"], name: "index_job_applications_on_user_id_and_job_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "address"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.string   "link"
    t.boolean  "transcript"
    t.boolean  "license"
    t.boolean  "resume"
    t.float    "gpa",         limit: 24
    t.integer  "company_id"
    t.text     "description"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "paid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
