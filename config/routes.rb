Rails.application.routes.draw do

  resources :safe_works do
    put "/approve" => 'safe_works#approvals'
  end
  root to: 'dummy#index'

  #Login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #Signup
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #dummy
  resources :dummy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
