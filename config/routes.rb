Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :solutions
  resources :vf_cases
  root to: 'vf_cases#index'
  namespace :api do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
  end
  get 'waiting_list', to: 'solutions#waiting_list'
end
