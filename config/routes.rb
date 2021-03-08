Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'

  get '/signin', to: 'users#new'
  # get '/events/new', to: 'events#show'
  # get "/users/:id", to: "users#show"
  put 'events/add/:id', to: 'events#add'

  resources :users do
    resources :events
  end
  
end
