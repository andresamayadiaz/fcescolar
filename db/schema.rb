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

ActiveRecord::Schema.define(version: 20150211044556) do

  create_table "background_official_docs", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.text     "responsive_letter"
    t.integer  "responsive_due_days"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "background_official_docs", ["franchise_id"], name: "index_background_official_docs_on_franchise_id", using: :btree

  create_table "campuses", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "classrooms"
    t.integer  "franchise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campuses", ["franchise_id"], name: "index_campuses_on_franchise_id", using: :btree

  create_table "careers", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.string   "rvoe"
    t.integer  "study_level_id"
    t.string   "serie"
    t.string   "clave_estadistica"
    t.string   "clave_dgp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_file_file_name"
    t.string   "auth_file_content_type"
    t.integer  "auth_file_file_size"
    t.datetime "auth_file_updated_at"
  end

  add_index "careers", ["franchise_id"], name: "index_careers_on_franchise_id", using: :btree
  add_index "careers", ["study_level_id"], name: "index_careers_on_study_level_id", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contracts_templates", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.text     "content"
    t.string   "serie"
    t.integer  "consecutive_init"
    t.integer  "consecutive_next"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts_templates", ["franchise_id"], name: "index_contracts_templates_on_franchise_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curricular_lines", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "curricular_lines", ["franchise_id"], name: "index_curricular_lines_on_franchise_id", using: :btree

  create_table "degree_achievements_categories", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "degree_achievements_categories", ["franchise_id"], name: "index_degree_achievements_categories_on_franchise_id", using: :btree

  create_table "franchises", force: true do |t|
    t.string   "name"
    t.string   "clave_dgp"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "official_domains", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "official_domains", ["franchise_id"], name: "index_official_domains_on_franchise_id", using: :btree

  create_table "relationship_types", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationship_types", ["franchise_id"], name: "index_relationship_types_on_franchise_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "study_levels", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_levels", ["franchise_id"], name: "index_study_levels_on_franchise_id", using: :btree

  create_table "subjects", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.integer  "study_level_id"
    t.integer  "curricular_line_id"
    t.string   "clave"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["curricular_line_id"], name: "index_subjects_on_curricular_line_id", using: :btree
  add_index "subjects", ["franchise_id"], name: "index_subjects_on_franchise_id", using: :btree
  add_index "subjects", ["name"], name: "index_subjects_on_name", using: :btree
  add_index "subjects", ["study_level_id"], name: "index_subjects_on_study_level_id", using: :btree

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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
