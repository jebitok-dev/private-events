Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'

  get '/signin', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete "/sign_out", to: "sessions#delete"

  resources :users, only: %i[show new create]
  resources :eventss, only: %i[index show new create ]
end
