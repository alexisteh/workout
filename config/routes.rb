Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#home'
  get '/home', to: 'sessions#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/logout', to: 'sessions#destroy' 

  get '/seshes/new', to: 'seshes#new'
  post '/seshes', to: 'seshes#create'

  get '/trainings/new', to: 'trainings#new' 
  post '/trainings', to: 'trainings#create' 

  post '/gyms', to: 'gyms#create' 
  get '/gyms/edit', to: 'gyms#edit', as: 'edit_gym'
  patch '/gyms', to: 'gyms#update'
  get '/gyms/delete', to: 'gyms#delete', as: 'delete_gym'

end 
