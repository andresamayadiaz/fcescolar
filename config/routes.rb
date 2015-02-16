Rails.application.routes.draw do
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

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
