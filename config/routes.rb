Rails.application.routes.draw do
  resources :officers

  root to: 'visitors#index'
  devise_for :users
  resources :users  do
    collection do
      patch 'update_password'
      patch 'update_selected_franchise'
      patch 'set_active_role'
    end
  end

  get '/profile/:id'=>"people#profile"
  get '/profile/'=>'people#profile_without_id'
  get '/search/'=>'visitors#search'
  
  resources :groups do
    collection do
      get 'block_it'
      get 'unblock_it'
      get 'close_it'
      get 'open_it'
      get 'new_enroll_student'
      get 'get_years_of_selected_study_plan'
      get 'get_months_of_selected_year'
      get 'get_week_day_of_selected_month'
      get 'load_latest_added_students'
      post 'search_student'
      get 'load'
      get 'create_enroll_student'
      get 'unsubscribe'
      get 'global_unsubscribe'
      get 'create_global_unsubscribe'
      get 'create_unsubscribe'
      get 'load_group_subscription'
      get 'load_subscription'
    end
  end

  resources :people do
    collection do
      get 'download_pending_teacher_dictamination'
      get 'matching_date_and_user'
      get 'download_personal_record_file'
      patch 'upload_profile_picture'
      get 'get_state_by_country_id'
      post 'search'
      get 'get_campus_by_franchise_id'
      get 'assign_roles'
      get 'manage_personal_record_file'
      get 'search_by_name'
      post 'add_new_role'
      patch 'change_role_status'
      put 'block_or_unblock'
      post 'upload_document'
      patch 'update_country_and_state'
      post 'generate_responsive_letter'
      post 'auth_to_sign_responsive_letter'
      get 'autocomplete_person_name'
      get 'new_contract'
      post 'generate_contract'
      post 'preview_contract'
      post 'download_contract'
      get 'new_teacher_dictamination'
      post 'create_teacher_dictamination'
      get 'accept_reject_dictamination'
      get 'get_active_subjects_by_study_plan_id'
      get 'reject_dictamination'
      post 'accept_dictamination'
      get 'download_evidence'
      get 'new_group'
      get 'copy_new_group'
      get 'load_group_preferences'
      get 'generate_full_groups'
      get 'generate_single_group'
      get 'search_group'
      get 'get_group_id_number'
      post 'create_group'
      get 'search_group_by_group_id'
      get 'search_group_by_year'
      get 'get_period_of_year_for_search_group'
      get 'view_group'
      get 'get_subjects_of_dictamination'
      get 'export_to_csv'
      post 'create_csv'
      get 'import'
      post 'create_from_import'
      delete 'delete_personal_record_file'
    end
  end

  resources :person_imports
  
  resources :periods do
    collection do
      get 'add_period_detail'
      get 'remove_period_detail'
      get 'calculate_end_month'
      post 'add_multiple_period_detail'
    end
  end

  resources :notifications do
    member { get :mark_as_read }
  end

  resources :time_slots do
    collection do
      get 'filter_campus'
    end
  end

  resources :classrooms do
    collection do
      get 'filter_campus'
    end
  end

  resources :subjects do
    collection do
      get 'get_selected_subjects'
      get 'get_subjects_by_study_level'
    end
  end

  resources :curricular_lines

  resources :relationship_types

  resources :contracts_templates

  resources :official_domains

  resources :background_official_docs

  mount Ckeditor::Engine => '/ckeditor'
  resources :degree_achievements_categories

  resources :careers do
    member { get :download }
    collection do
      get 'check_for_study_plan'
    end
  end

  resources :study_levels

  resources :study_plans do
    collection do
      get 'filter'
      get 'enable'
      post 'create_schedule'
      get 'get_subject_by_curricular_line'
      get 'get_active_classrooms_by_campus_id'
      get 'get_active_time_slots_by_campus_id'
      get 'get_period_years_by_study_plan_id'
      get 'get_period_months_by_period_detail_id'
    end
  end

  resources :states

  resources :countries

  resources :campuses do
    collection do
      get 'get_by_franchise_id'
    end
  end

  resources :franchises
end
