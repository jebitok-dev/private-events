Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'

  get '/signin', to: 'users#new'
  get '/events/new', to: 'events#show'
  get 'events/:id/with_user/:user_id', to: 'events#show'

  resources :users do
    resources :events
  end
  
end
