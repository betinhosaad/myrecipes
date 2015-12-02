Rails.application.routes.draw do
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  resources :recipes do
    post 'like', on: :member
  end
  
  resources :chefs, except: [:new]
  get '/register', to: 'chefs#new', as: 'register'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
end
