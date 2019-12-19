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
    resources :domains, only: [:index]
    resources :impacts, only: [:index]
    resources :tctypes, only: [:index]
    get 'waiting_list', to: 'solutions#waiting_list'
    get 'approve_solution/:id', to: 'solutions#approve_solution'
  end
end
