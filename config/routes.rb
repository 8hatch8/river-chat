Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:show]
  resources :rooms, only: [:show]
end
