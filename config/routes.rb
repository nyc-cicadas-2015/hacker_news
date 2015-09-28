Rails.application.routes.draw do
  root 'posts#index'
  resources :posts

  resources :users
  # match '/signup' => 'users#new'

  resources :comments

  # resources :sessions
  # Session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', :via => :delete
end
