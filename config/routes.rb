Rails.application.routes.draw do
  root "events#index"

  resources :events

  resources :users
    get 'signup' => 'users#new'

  resource :session
    get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'

  resources :donators

  resources :inventories

  resources :categories
end