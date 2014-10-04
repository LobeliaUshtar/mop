Rails.application.routes.draw do
  root "events#index"

  resources :events

  resources :users
    get 'signup' => 'users#new'

  resources :sessions
    get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'

  resources :items
end