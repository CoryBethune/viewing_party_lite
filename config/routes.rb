Rails.application.routes.draw do
  root 'users#landing'
  resources :users, only: [:new, :create]
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/discover', to: 'users#discover'
  get '/users/:user_id/movies', to: 'users_movies#index'
  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
  get '/users/:user_id/movies/:movie_id', to: 'users_movies#show'
  post '/users/:user_id/movies/:movie_id/viewing-party/create', to: 'viewing_parties#create'
  resources :parties, only: [:index]
end
