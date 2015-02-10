Rails.application.routes.draw do
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
