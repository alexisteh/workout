Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#home'
  get '/home', to: 'sessions#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/details', to: 'users#details' 

  get '/logout', to: 'sessions#destroy' 

  get '/seshes/new', to: 'seshes#new'
  post '/seshes', to: 'seshes#create'
  get '/seshes/:id/edit', to: 'seshes#edit', as: 'edit_sesh' 
  post '/seshes/update', to: 'seshes#update' 
  get '/seshes/:id/deletelog',to: 'seshes#delete_log', as: 'delete_sesh_log' 
  get '/seshes/:id/deletehome',to: 'seshes#delete_home', as: 'delete_sesh_home' 
  get '/sesh/:id/activate', to: 'seshes#activate', as: "activate_sesh"

  get '/workouts/new', to: 'workouts#new' 
  post '/workouts', to: 'workouts#create' 
  get '/workouts', to: 'workouts#index' 
  get '/workouts/delete', to: 'workouts#delete', as: 'delete_workout'

  post '/gyms', to: 'gyms#create' 
  get '/gyms/edit', to: 'gyms#edit', as: 'edit_gym'
  patch '/gyms', to: 'gyms#update'
  get '/gyms/delete', to: 'gyms#delete', as: 'delete_gym'

  get '/workoutexercises/edit', to: 'workoutexercises#edit', as: 'edit_exercise'
  get '/workoutexercises/:id', to: 'workoutexercises#show'
  patch '/workoutexercises', to: 'workoutexercises#update' 
  
  get '/exercises', to: 'exercises#index' 
  post '/exercises/create', to: 'exercises#create' 
  get '/exercises/delete', to: 'exercises#delete', as: 'delete_exercise'
  get '/exercises/edit', to: 'exercises#edit', as: 'edit_ex'
  patch '/exercises', to: 'exercises#update'

  get '/logbook', to: 'sessions#logbook'

end 
