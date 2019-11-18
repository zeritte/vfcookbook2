Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :solutions
  resources :vf_cases
  root to: 'vf_cases#index'
  namespace :api do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    resources :solutions, only: [:index, :show, :create, :update, :destroy]
    resources :vf_cases, only: [:index, :show, :create, :update, :destroy]
    get 'waiting_list', to: 'solutions#waiting_list'
  end
end
