Rails.application.routes.draw do

  get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/index'
  # Static pages
  root 'static_pages#home'

  resources :users, only: [:new, :create, :show]
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
