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

ActiveRecord::Schema.define(version: 20150430132431) do

  create_table "approved_subjects", force: true do |t|
    t.integer  "teacher_dictamination_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "approved_subjects", ["subject_id"], name: "index_approved_subjects_on_subject_id", using: :btree
  add_index "approved_subjects", ["teacher_dictamination_id"], name: "teacher_dict_id", using: :btree

  create_table "audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

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

  create_table "background_official_docs_schedules", force: true do |t|
    t.integer "background_official_doc_id"
    t.integer "schedule_id"
  end

  add_index "background_official_docs_schedules", ["background_official_doc_id"], name: "official_doc_id", using: :btree
  add_index "background_official_docs_schedules", ["schedule_id"], name: "index_background_official_docs_schedules_on_schedule_id", using: :btree

  create_table "campuses", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "number_of_classrooms"
    t.integer  "franchise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campuses", ["franchise_id"], name: "index_campuses_on_franchise_id", using: :btree

  create_table "careers", force: true do |t|
    t.integer  "franchise_id"
    t.string   "name"
    t.boolean  "status",                 default: true
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

  create_table "classrooms_schedules", force: true do |t|
    t.integer "classroom_id"
    t.integer "schedule_id"
  end

  add_index "classrooms_schedules", ["classroom_id"], name: "index_classrooms_schedules_on_classroom_id", using: :btree
  add_index "classrooms_schedules", ["schedule_id"], name: "index_classrooms_schedules_on_schedule_id", using: :btree

  create_table "contact_telephones", force: true do |t|
    t.integer  "person_id"
    t.string   "phone_number"
    t.string   "phone_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_telephones", ["person_id"], name: "index_contact_telephones_on_person_id", using: :btree

  create_table "contracts", force: true do |t|
    t.integer  "contracts_template_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["contracts_template_id"], name: "index_contracts_on_contracts_template_id", using: :btree
  add_index "contracts", ["person_id"], name: "index_contracts_on_person_id", using: :btree

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

  create_table "degree_achievements_categories_schedules", force: true do |t|
    t.integer "degree_achievements_category_id"
    t.integer "schedule_id"
  end

  add_index "degree_achievements_categories_schedules", ["degree_achievements_category_id"], name: "degree_category_id", using: :btree
  add_index "degree_achievements_categories_schedules", ["schedule_id"], name: "index_degree_achievements_categories_schedules_on_schedule_id", using: :btree

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

  create_table "people", force: true do |t|
    t.string   "curp"
    t.string   "rfc"
    t.string   "email"
    t.string   "first_name"
    t.string   "fathers_maiden_name"
    t.string   "mothers_maiden_name"
    t.integer  "country_id"
    t.integer  "state_id"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "last_academic_degree"
    t.integer  "franchise_id"
    t.integer  "campus_id"
    t.boolean  "status",                       default: true
    t.string   "last_name"
  end

  add_index "people", ["country_id"], name: "index_people_on_country_id", using: :btree
  add_index "people", ["state_id"], name: "index_people_on_state_id", using: :btree

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

  create_table "person_emails", force: true do |t|
    t.integer  "person_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_emails", ["person_id"], name: "index_person_emails_on_person_id", using: :btree

  create_table "person_living_addresses", force: true do |t|
    t.string   "street"
    t.string   "num_ext"
    t.string   "num_int"
    t.string   "colonia"
    t.string   "cp"
    t.string   "municipio"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "phone_emergency"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_living_addresses", ["country_id"], name: "index_person_living_addresses_on_country_id", using: :btree
  add_index "person_living_addresses", ["person_id"], name: "index_person_living_addresses_on_person_id", using: :btree
  add_index "person_living_addresses", ["state_id"], name: "index_person_living_addresses_on_state_id", using: :btree

  create_table "person_work_places", force: true do |t|
    t.string   "empresa"
    t.string   "puesto"
    t.string   "calle"
    t.string   "municipio"
    t.string   "num_ext"
    t.string   "num_int"
    t.string   "colonia"
    t.integer  "cp"
    t.integer  "state_id"
    t.integer  "country_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_work_places", ["country_id"], name: "index_person_work_places_on_country_id", using: :btree
  add_index "person_work_places", ["person_id"], name: "index_person_work_places_on_person_id", using: :btree
  add_index "person_work_places", ["state_id"], name: "index_person_work_places_on_state_id", using: :btree

  create_table "personal_record_files", force: true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "document_type"
    t.integer  "background_official_doc_id"
    t.integer  "attach_user_id"
    t.date     "due_date"
    t.boolean  "is_responsive_letter"
    t.text     "motive"
    t.date     "match_date"
    t.integer  "match_user_id"
    t.boolean  "has_been_matched"
  end

  add_index "personal_record_files", ["person_id"], name: "index_personal_record_files_on_person_id", using: :btree

  create_table "related_people", force: true do |t|
    t.integer  "person_id"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relation_name"
  end

  add_index "related_people", ["person_id"], name: "index_related_people_on_person_id", using: :btree

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

  create_table "schedules", force: true do |t|
    t.integer  "study_plan_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["campus_id"], name: "index_schedules_on_campus_id", using: :btree
  add_index "schedules", ["study_plan_id"], name: "index_schedules_on_study_plan_id", using: :btree

  create_table "schedules_time_slots", force: true do |t|
    t.integer "time_slot_id"
    t.integer "schedule_id"
  end

  add_index "schedules_time_slots", ["schedule_id"], name: "index_schedules_time_slots_on_schedule_id", using: :btree
  add_index "schedules_time_slots", ["time_slot_id"], name: "index_schedules_time_slots_on_time_slot_id", using: :btree

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

  create_table "study_plan_periods", force: true do |t|
    t.string   "period_name"
    t.integer  "curricular_line_id"
    t.integer  "study_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_plan_periods", ["curricular_line_id"], name: "index_study_plan_periods_on_curricular_line_id", using: :btree
  add_index "study_plan_periods", ["study_plan_id"], name: "index_study_plan_periods_on_study_plan_id", using: :btree

  create_table "study_plan_subjects", force: true do |t|
    t.integer  "study_plan_period_id"
    t.integer  "curricular_line_id"
    t.integer  "subject_id"
    t.string   "name"
    t.integer  "weekly_frequency"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_plan_subjects", ["curricular_line_id"], name: "index_study_plan_subjects_on_curricular_line_id", using: :btree
  add_index "study_plan_subjects", ["study_plan_period_id"], name: "index_study_plan_subjects_on_study_plan_period_id", using: :btree
  add_index "study_plan_subjects", ["subject_id"], name: "index_study_plan_subjects_on_subject_id", using: :btree

  create_table "study_plans", force: true do |t|
    t.integer  "career_id"
    t.integer  "period_id"
    t.integer  "number_of_periods"
    t.string   "name"
    t.integer  "attendance_rate"
    t.integer  "extra_opportunities"
    t.boolean  "status",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_plans", ["career_id"], name: "index_study_plans_on_career_id", using: :btree
  add_index "study_plans", ["period_id"], name: "index_study_plans_on_period_id", using: :btree

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

  create_table "subjects_teacher_dictaminations", force: true do |t|
    t.integer "subject_id"
    t.integer "teacher_dictamination_id"
  end

  add_index "subjects_teacher_dictaminations", ["subject_id"], name: "index_subjects_teacher_dictaminations_on_subject_id", using: :btree
  add_index "subjects_teacher_dictaminations", ["teacher_dictamination_id"], name: "teacher_dict_id", using: :btree

  create_table "teacher_dictaminations", force: true do |t|
    t.integer  "person_id"
    t.integer  "study_plan_id"
    t.string   "witness_1"
    t.string   "witness_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                default: "Pending"
    t.string   "evidence_file_name"
    t.string   "evidence_content_type"
    t.integer  "evidence_file_size"
    t.datetime "evidence_updated_at"
  end

  add_index "teacher_dictaminations", ["person_id"], name: "index_teacher_dictaminations_on_person_id", using: :btree
  add_index "teacher_dictaminations", ["study_plan_id"], name: "index_teacher_dictaminations_on_study_plan_id", using: :btree

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
    t.integer  "person_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.boolean "status",             default: true
    t.string  "contract",                          null: false
    t.date    "contract_sign_date",                null: false
    t.date    "date_of_receipt",                   null: false
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
