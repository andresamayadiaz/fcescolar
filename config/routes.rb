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
      patch 'generate_responsive_letter'
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

  resources :careers

  resources :study_levels

  resources :states

  resources :countries

  resources :campuses do
    collection do
      get 'get_by_franchise_id'
    end
  end

  resources :franchises
end
