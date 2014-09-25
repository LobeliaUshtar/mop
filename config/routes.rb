Rails.application.routes.draw do
  root "users#index"

  resources :events

  resources :users
  get 'signup' => 'users#new'
end