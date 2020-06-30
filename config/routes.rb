Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#home'
  get '/home', to: 'sessions#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/logout', to: 'sessions#destroy' 

  get '/workouts/new', to: 'workouts#new' 
  post '/workouts', to: 'workouts#create' 

  get '/seshes/new', to: 'seshes#new'
  post '/seshes', to: 'seshes#create'
end 
