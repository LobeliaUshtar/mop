Rails.application.routes.draw do
  root "inventories#index"

  resources :inventories
    get 'inventories/filter/:filter' => 'inventories#index', as: :filtered_inventories

  resources :events

  resources :users
    get 'signup' => 'users#new'

  resource :session
    get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'

  resources :donators

  resources :categories
end