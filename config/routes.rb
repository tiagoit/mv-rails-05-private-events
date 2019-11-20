Rails.application.routes.draw do

  # Static pages
  root 'static_pages#home'

  # Users
  resources :users, only: [:new, :create, :show]
  get '/signup', to: 'users#new'

  # Auth
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Events
  resources :events, only: [:create]
  
  # Attendance
  get '/attendee/:event_id', to: 'events#attendee', as: 'attendee'
  post '/attendance', to: 'events#attendance'

end
