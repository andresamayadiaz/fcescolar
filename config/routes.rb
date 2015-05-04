Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users  do
    collection do
      patch 'update_password'
      patch 'set_active_role'
    end
  end

  get '/profile/:id'=>"people#profile"

  resources :people do
    collection do
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
      get 'new_teacher_dictamination'
      post 'create_teacher_dictamination'
      get 'accept_reject_dictamination'
      get 'get_active_subjects_by_study_plan_id'
      get 'reject_dictamination'
      post 'accept_dictamination'
      get 'download_evidence'
      get 'new_group'
      get 'load_group_preferences'
    end
  end
  
  resources :periods do
    collection do
      get 'add_period_detail'
      get 'remove_period_detail'
      get 'calculate_end_month'
    end
  end

  resources :notifications

  resources :time_slots

  resources :classrooms

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
