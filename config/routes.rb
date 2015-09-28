Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :users
  resources :comments

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', :via => :delete
end
