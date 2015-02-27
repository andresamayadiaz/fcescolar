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

ActiveRecord::Schema.define(version: 20150227040345) do

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

  create_table "careers_subjects", id: false, force: true do |t|
    t.integer "career_id"
    t.integer "subject_id"
  end

  add_index "careers_subjects", ["career_id"], name: "index_careers_subjects_on_career_id", using: :btree
  add_index "careers_subjects", ["subject_id"], name: "index_careers_subjects_on_subject_id", using: :btree

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

  create_table "classrooms", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "campus_id"
    t.string   "name"
    t.integer  "max_capacity"
    t.integer  "consecutive"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["campus_id"], name: "index_classrooms_on_campus_id", using: :btree
  add_index "classrooms", ["franchise_id"], name: "index_classrooms_on_franchise_id", using: :btree

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

  create_table "notifications", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "message"
    t.string   "destination_role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "notifications", ["franchise_id"], name: "index_notifications_on_franchise_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "official_domains", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "official_domains", ["franchise_id"], name: "index_official_domains_on_franchise_id", using: :btree

  create_table "period_details", force: true do |t|
    t.integer  "period_id"
    t.date     "initial_month"
    t.date     "end_month"
    t.date     "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "period_details", ["period_id"], name: "index_period_details_on_period_id", using: :btree

  create_table "periods", force: true do |t|
    t.integer  "franchise_id"
    t.date     "initial_month"
    t.integer  "month_length"
    t.integer  "number_of_blocks"
    t.date     "start_year"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "periods", ["franchise_id"], name: "index_periods_on_franchise_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "last_academic_degree"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "street"
    t.string   "external"
    t.string   "internal"
    t.string   "colonia"
    t.string   "cp"
    t.string   "city"
    t.string   "emergency_phone"
    t.string   "additional_email_1"
    t.string   "additional_email_2"
    t.string   "phones_1"
    t.string   "phone_type_1"
    t.string   "phones_2"
    t.string   "phone_type_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["country_id"], name: "index_profiles_on_country_id", using: :btree
  add_index "profiles", ["state_id"], name: "index_profiles_on_state_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "relationship_types", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationship_types", ["franchise_id"], name: "index_relationship_types_on_franchise_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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

  create_table "time_slots", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "campus_id"
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_slots", ["campus_id"], name: "index_time_slots_on_campus_id", using: :btree
  add_index "time_slots", ["franchise_id"], name: "index_time_slots_on_franchise_id", using: :btree

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
    t.string   "active_role"
    t.integer  "franchise_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
