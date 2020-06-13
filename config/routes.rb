Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :sessions, only: [:index]
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  
  get 'auth/:provider/callback', to: 'sessions#create'
  # match '/auth/google/callback', to: 'sessions#create', via: [:get, :post]
  # get "auth/failure", to: redirect(‘/’)

  resources :categories do
    resources :lists, only: [:index, :show]
  end

  resources :lists, only: [:new, :create, :edit, :update, :destroy]
  
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  resources :users, only: [:index, :edit, :update]
end
