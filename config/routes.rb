Rails.application.routes.draw do
  resources :franchises

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
