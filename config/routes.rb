Rails.application.routes.draw do
  resources :subjects

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

  resources :campuses

  resources :franchises

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
