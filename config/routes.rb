Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"

  resources :sessions, only: [:index]
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :categories do
    resources :lists
  end

  resources :lists
  
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"


  resources :users
  get '/all_users', to: "users#users"
  get '/most_recent_list', to: "users#most_recent_list"


  resources :items, only: [:new, :create]
end
